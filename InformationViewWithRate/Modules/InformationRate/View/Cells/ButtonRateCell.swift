//
//  ButtonRateCell.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 11.12.2021.
//

import UIKit

//MARK: - ячейка выбора коэффициента
@available(iOS 12.0, *)
class ButtonRateCell: CellViewType {
    
    private var presenter: СhangeRatePresenterType
    
    private let layerView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.957, green: 0.969, blue: 0.984, alpha: 1).cgColor
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rateSelection: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var strokeView: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 12, height: 6)
        view.image = UIImage(named: "Vector")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupTitle(){
        title.textColor = UIColor(red: 0.388, green: 0.435, blue: 0.49, alpha: 1)
        title.font = UIFont(name: "SFProText-Regular", size: 17)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        title.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    private func setupTitleWhenRateSelectionExit(){
        title.textColor = UIColor(red: 0.388, green: 0.435, blue: 0.49, alpha: 1)
        title.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        title.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.08])
    }
    
    //MARK: - init -
    init(presenter: СhangeRatePresenterType, title: String, rateSelection: String?){
        self.presenter = presenter
        super.init()
        commonInit(title: title, rateSelection: rateSelection)
        addConstraints()
        self.setupFunctionLayerView()
    }
    
    private func commonInit(title: String, rateSelection: String?){
        if let rateSelection = rateSelection {
            self.rateSelection.text = rateSelection
            setupRateSelection()
        } else {
            setupTitle()
        }
        self.title.text = title
    }
    
    private func setupFunctionLayerView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.chooseRate(_:)))
        self.layerView.addGestureRecognizer(tap)
        self.layerView.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - @objc func
//    Функция, срабатывающая по нажатию на layerView
    @objc
    func chooseRate(_ sender: UITapGestureRecognizer? = nil) {
        self.presenter.changeRate(nameRate: title.text!)
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        contentView.addSubview(layerView)
        [title, strokeView].forEach { element in
            layerView.addSubview(element)
        }
    }
    
    private func setupRateSelection(){
        setupTitleWhenRateSelectionExit()
        layerView.addSubview(rateSelection)
    }
    
    override func addConstraints() {
        let defaultConstant: CGFloat = 16
        
        super.addConstraints()
        
        let titleBottomConstraint = title.bottomAnchor.constraint(equalTo: layerView.bottomAnchor, constant: -20)
        titleBottomConstraint.priority = UILayoutPriority(100)
        titleBottomConstraint.isActive = true
        
        let titleTopConstraint = title.topAnchor.constraint(equalTo: layerView.topAnchor, constant: 20)
        titleTopConstraint.priority = UILayoutPriority(100)
        titleTopConstraint.isActive = true
        
        
        NSLayoutConstraint.activate([
            layerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: defaultConstant),
            layerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: defaultConstant),
            layerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            layerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -defaultConstant),
            
            strokeView.centerYAnchor.constraint(equalTo: layerView.centerYAnchor),
            strokeView.trailingAnchor.constraint(equalTo: layerView.trailingAnchor, constant: -27),
            
            title.leadingAnchor.constraint(equalTo: layerView.leadingAnchor, constant: defaultConstant),
            title.trailingAnchor.constraint(lessThanOrEqualTo: strokeView.leadingAnchor, constant: -20)
            ])
        
        if rateSelection.text != "" {
            titleBottomConstraint.isActive = false
            titleTopConstraint.isActive = false
            NSLayoutConstraint.activate([
                title.topAnchor.constraint(equalTo: layerView.topAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                rateSelection.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
                rateSelection.leadingAnchor.constraint(equalTo: layerView.leadingAnchor, constant: defaultConstant),
                rateSelection.bottomAnchor.constraint(equalTo: layerView.bottomAnchor, constant: -10),
                rateSelection.trailingAnchor.constraint(equalTo: strokeView.leadingAnchor, constant: -20),
            ])
        }
    }
}

