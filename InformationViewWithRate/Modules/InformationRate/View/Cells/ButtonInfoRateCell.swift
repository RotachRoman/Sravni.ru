//
//  ButtonRateCell.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 11.12.2021.
//

import UIKit

//MARK: - ячейка выбора коэффициента
class ButtonRateCell: CellViewType {
    
    private var presenter: СhangeRatePresenterType!
    
    //    MARK: - UI elements
    private let layerButton: UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor(red: 0.957, green: 0.969, blue: 0.984, alpha: 1).cgColor
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        title.font = UIFont.systemFont(ofSize: 17, weight: .regular)
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
//    init(title: String, rateSelection: String?){
//        self.presenter = presenter
//        super.init()
//        addConstraints()
//        self.setupFunctionLayerView()
//    }
    
    private func commonInit(presenter: СhangeRatePresenterType, title: String, rateSelection: String?){
        self.presenter = presenter
        if let rateSelection = rateSelection {
            self.rateSelection.text = rateSelection
            setupRateSelection()
        } else {
            setupTitle()
        }
        self.title.text = title
        self.setupFunctionLayerView()
    }
    
    private func setupFunctionLayerView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.chooseRate(_:)))
        self.layerButton.addGestureRecognizer(tap)
        self.layerButton.isUserInteractionEnabled = true
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    MARK: - @objc func
//    Функция, срабатывающая по нажатию на layerView
    @objc
    func chooseRate(_ sender: UITapGestureRecognizer? = nil) {
        self.presenter.changeRate(nameRate: title.text!)
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        contentView.addSubview(layerButton)
        [title, strokeView].forEach { element in
            layerButton.addSubview(element)
        }
    }
    
    private func setupRateSelection(){
        setupTitleWhenRateSelectionExit()
        layerButton.addSubview(rateSelection)
    }
    
    override func addConstraints() {
        let defaultConstant: CGFloat = 16
        
        super.addConstraints()
        
        let titleBottomConstraint = title.bottomAnchor.constraint(equalTo: layerButton.bottomAnchor, constant: -20)
        titleBottomConstraint.priority = UILayoutPriority(300)
        titleBottomConstraint.isActive = true
        
        let titleTopConstraint = title.topAnchor.constraint(equalTo: layerButton.topAnchor, constant: 20)
        titleTopConstraint.priority = UILayoutPriority(300)
        titleTopConstraint.isActive = true
        
        
        NSLayoutConstraint.activate([
            layerButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: defaultConstant),
            layerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: defaultConstant),
            layerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            layerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -defaultConstant),
            
            strokeView.centerYAnchor.constraint(equalTo: layerButton.centerYAnchor),
            strokeView.trailingAnchor.constraint(equalTo: layerButton.trailingAnchor, constant: -27),
            
            title.leadingAnchor.constraint(equalTo: layerButton.leadingAnchor, constant: defaultConstant),
            title.trailingAnchor.constraint(lessThanOrEqualTo: strokeView.leadingAnchor, constant: -20)
            ])
        
        if rateSelection.text != "" {
            titleBottomConstraint.isActive = false
            titleTopConstraint.isActive = false
            NSLayoutConstraint.activate([
                title.topAnchor.constraint(equalTo: layerButton.topAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                rateSelection.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
                rateSelection.leadingAnchor.constraint(equalTo: layerButton.leadingAnchor, constant: defaultConstant),
                rateSelection.bottomAnchor.constraint(equalTo: layerButton.bottomAnchor, constant: -10),
                rateSelection.trailingAnchor.constraint(equalTo: strokeView.leadingAnchor, constant: -20),
            ])
        }
    }
}
//MARK: - Updatable
extension ButtonRateCell: Updatable {
    typealias ViewData = ButtonChangeTariffViewData
    
    func updateWithViewData(viewData: ViewData) {
        commonInit(presenter: viewData.presenter, title: viewData.title, rateSelection: viewData.rateSelection)
        addConstraints()
    }
}
