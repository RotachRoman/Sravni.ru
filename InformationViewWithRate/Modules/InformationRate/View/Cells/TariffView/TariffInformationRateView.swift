//
//  TariffInformationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 28.11.2021.
//

import UIKit

// MARK: - Ячейка с тарифом
class TariffInformationRateView: ViewType {
    
    private let bezierView: UILabel = UILabel()
    private var backColor: UIColor!
    
    //    MARK: - UI elements
    private lazy var capsul: UILabel = {
        let view = UILabel()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var capsulLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
        var fontDescriptor = UIFont.systemFont(ofSize: 11, weight: .semibold).fontDescriptor
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.07
        
        var fontFeatures: [[UIFontDescriptor.FeatureKey : Int]]
        
        if #available(iOS 15.0, *) {
            fontFeatures = [[
                UIFontDescriptor.FeatureKey.type: kNumberSpacingType,
                UIFontDescriptor.FeatureKey.selector: kProportionalNumbersSelector,
                  ],[
                UIFontDescriptor.FeatureKey.type: kNumberCaseType,
                UIFontDescriptor.FeatureKey.selector: kUpperCaseNumbersSelector,
                  ],]
        } else {
            fontFeatures = [[
            UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
            UIFontDescriptor.FeatureKey.typeIdentifier: kProportionalNumbersSelector,
              ],[
            UIFontDescriptor.FeatureKey.featureIdentifier: kNumberCaseType,
            UIFontDescriptor.FeatureKey.typeIdentifier: kUpperCaseNumbersSelector,
              ],]
        }
        fontDescriptor = fontDescriptor.addingAttributes([.featureSettings: fontFeatures])
        label.font = UIFont(descriptor: fontDescriptor, size: 11)
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.5, .paragraphStyle: paragraphStyle])
        return label
    }()
    private lazy var ratioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.38])
        return label
    }()
    private lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.08])
        label.lineBreakMode = .byWordWrapping
        
        label.numberOfLines = 0
        return label
    }()
    
    //    MARK: - init -
    init(text: String,
         ratio: String,
         sale: String?,
         backgroundCoolor: UIColor,
         saleColor: UIColor) {
        super.init()
        commonInit(text: text, ratio: ratio, sale: sale, backgroundColor: backgroundCoolor, saleColor: saleColor)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(text: String,
                        ratio: String,
                        sale: String?,
                            backgroundColor: UIColor,
                        saleColor: UIColor) {
        aboutLabel.text = text
        ratioLabel.text = ratio
        self.backColor = backgroundColor
        if let sale = sale  {
            self.capsulLabel.text = sale
            self.capsul.layer.backgroundColor = saleColor.cgColor
        } else {
            self.ratioLabel.textColor = saleColor
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setupShadow(view: self)
    }
    
    //MARK: - Setup View -
    override func addSubviews(){
        bezierView.translatesAutoresizingMaskIntoConstraints = false
        super.addSubviews()
        self.addSubview(bezierView)
        bezierView.addSubview(aboutLabel)
        bezierView.addSubview(ratioLabel)
    }
    
    private func addAdditionalSubwiew(){
        bezierView.addSubview(capsul)
        capsul.addSubview(capsulLabel)
    }
    
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            bezierView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            bezierView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2),
            bezierView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bezierView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2),
            
            ratioLabel.topAnchor.constraint(equalTo: bezierView.topAnchor, constant: 16),
            ratioLabel.leadingAnchor.constraint(equalTo: bezierView.leadingAnchor, constant: 16),
            ratioLabel.trailingAnchor.constraint(lessThanOrEqualTo: bezierView.trailingAnchor),
            
            aboutLabel.topAnchor.constraint(equalTo: ratioLabel.bottomAnchor, constant: 8),
            aboutLabel.leadingAnchor.constraint(equalTo: bezierView.leadingAnchor, constant: 16),
            aboutLabel.trailingAnchor.constraint(equalTo: bezierView.trailingAnchor, constant: -16),
        ])
        
        if capsulLabel.text != "" {
            addAdditionalSubwiew()
            NSLayoutConstraint.activate([
                capsul.topAnchor.constraint(equalTo: bezierView.topAnchor, constant: 18),
                capsul.leadingAnchor.constraint(greaterThanOrEqualTo: bezierView.leadingAnchor),
                capsul.bottomAnchor.constraint(lessThanOrEqualTo: aboutLabel.bottomAnchor),
                capsul.trailingAnchor.constraint(equalTo: bezierView.trailingAnchor, constant: -16),
                
                capsulLabel.topAnchor.constraint(equalTo: capsul.topAnchor, constant: 3),
                capsulLabel.leadingAnchor.constraint(equalTo: capsul.leadingAnchor, constant: 4),
                capsulLabel.bottomAnchor.constraint(equalTo: capsul.bottomAnchor, constant: -3),
                capsulLabel.trailingAnchor.constraint(equalTo: capsul.trailingAnchor, constant: -4)
            ])
        }
        let bottomBezierViewConstraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: aboutLabel.bottomAnchor, constant: 16)
        bottomBezierViewConstraint.isActive = true
    }
}

//MARK: - Shadow -
extension TariffInformationRateView {
    private func setupShadow(view: UIView){
        let perimeterShadow = CALayer()
        let shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: 8)

        perimeterShadow.frame = view.bounds
        perimeterShadow.shadowPath = shadowPath.cgPath
//        perimeterShadow.colo
        perimeterShadow.shadowColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 0.06).cgColor
        perimeterShadow.shadowRadius = 14
        perimeterShadow.shadowOpacity = 1
        perimeterShadow.shadowOffset = CGSize(width: 0, height: 10)
        perimeterShadow.bounds = shadowPath.bounds
        perimeterShadow.needsDisplayOnBoundsChange = true
        view.layer.insertSublayer(perimeterShadow, at: 0)
        
        let layer1 = CALayer()
        layer1.frame = view.bounds
        layer1.shadowPath = shadowPath.cgPath
        layer1.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.02).cgColor
        layer1.shadowRadius = 6
        layer1.shadowOpacity = 1
        layer1.bounds = shadowPath.bounds
        layer1.shadowOffset = CGSize(width: 0, height: -2)
        layer1.needsDisplayOnBoundsChange = true
        view.layer.insertSublayer(layer1, at: 1)
        
        let layer2 = CALayer()
        layer2.backgroundColor = backColor.cgColor
        layer2.frame = view.bounds
        layer2.bounds = view.bounds
        layer2.cornerRadius = 8
        layer2.shadowOffset = .zero
        layer2.needsDisplayOnBoundsChange = true
        view.layer.insertSublayer(layer2, at: 2)
    }
}
