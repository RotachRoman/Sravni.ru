//
//  BalanceInformationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 05.12.2021.
//

import UIKit

// MARK: - Информационная ячейка "Равновесие"
@available(iOS 12.0, *)
class BalanceInformationRateView: CellViewType {
    
    //    MARK: - UI elements
    private let layerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.957, green: 0.969, blue: 0.984, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.41])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textComponent: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - init -
    init(title: String, text: String){
        super.init()
        self.title.text = title
        let regularAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)]
        let boldAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)]
        let changedText = text.changeStyle(startTeg: "&*", endTeg: "*&", normalAttribute: regularAttribute, tegAttribute: boldAttribute)
        self.textComponent.attributedText = changedText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        contentView.addSubview(layerView)
        layerView.addSubview(title)
        layerView.addSubview(textComponent)
    }
    
    override func addConstraints() {
        super.addConstraints()
        
        let constant: CGFloat = 16
        NSLayoutConstraint.activate([
            
            layerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            layerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constant),
            layerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            layerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -constant),
            
            title.topAnchor.constraint(equalTo: layerView.topAnchor, constant: 14),
            title.leadingAnchor.constraint(equalTo: layerView.leadingAnchor, constant: constant),
            title.trailingAnchor.constraint(equalTo: layerView.trailingAnchor, constant: -constant),
            
            textComponent.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            textComponent.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            textComponent.bottomAnchor.constraint(equalTo: layerView.bottomAnchor, constant: -14),
            textComponent.trailingAnchor.constraint(equalTo: layerView.trailingAnchor, constant: -constant)
        ])
    }
    
}
