//
//  BezierInformationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 28.11.2021.
//

import UIKit

@available(iOS 10.0, *)
class TariffInformationRateView: CellViewType {
    
    private let bezierView: UIView = UIView()
    
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

        var fontFeatures = [[
        UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
        UIFontDescriptor.FeatureKey.typeIdentifier: kProportionalNumbersSelector,
          ],[
        UIFontDescriptor.FeatureKey.featureIdentifier: kNumberCaseType,
        UIFontDescriptor.FeatureKey.typeIdentifier: kUpperCaseNumbersSelector,
          ],]

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
        label.attributedText = NSMutableAttributedString(string: "×0,6", attributes: [NSAttributedString.Key.kern: 0.38])
        return label
    }()
    private lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.attributedText = NSMutableAttributedString(string: "Если мощность больше 150 лошадинных сил придется заплатить больше", attributes: [NSAttributedString.Key.kern: -0.08])
        label.lineBreakMode = .byWordWrapping
        
        label.numberOfLines = 0
        return label
    }()
    
    init(text: String,
         ratio: String,
         sale: String?,
         backgroundCoolor: UIColor,
         saleColor: UIColor) {
        super.init()
        commonInit(text: text, ratio: ratio, sale: sale, backgroundCoolor: backgroundCoolor, saleColor: saleColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(text: String,
                        ratio: String,
                        sale: String?,
                            backgroundCoolor: UIColor,
                        saleColor: UIColor) {
        aboutLabel.text = text
        ratioLabel.text = ratio
        setupMyShadow(backgroundCoolor: backgroundCoolor)
        if let sale = sale  {
            self.capsulLabel.text = sale
            self.capsul.layer.backgroundColor = saleColor.cgColor
        } else {
            self.ratioLabel.textColor = saleColor
        }
    }
    
    override func addSubviews(){
        bezierView.translatesAutoresizingMaskIntoConstraints = false
        
        super.addSubviews()
        self.addSubview(bezierView)
        
        bezierView.addSubview(aboutLabel)
        bezierView.addSubview(ratioLabel)
        if capsul.text != nil {
            bezierView.addSubview(capsul)
            capsul.addSubview(capsulLabel)
        }
    }
    
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            bezierView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            bezierView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2),
            bezierView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            bezierView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2),
            
            ratioLabel.topAnchor.constraint(equalTo: bezierView.topAnchor, constant: 16),
            ratioLabel.leadingAnchor.constraint(equalTo: bezierView.leadingAnchor, constant: 16),
            ratioLabel.trailingAnchor.constraint(lessThanOrEqualTo: bezierView.trailingAnchor),
            
            aboutLabel.topAnchor.constraint(equalTo: ratioLabel.bottomAnchor, constant: 8),
            aboutLabel.leadingAnchor.constraint(equalTo: bezierView.leadingAnchor, constant: 16),
            aboutLabel.trailingAnchor.constraint(equalTo: bezierView.trailingAnchor, constant: -16)
        ])
        if capsul.text != nil {
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
        bottomBezierViewConstraint.priority = UILayoutPriority(1)
        bottomBezierViewConstraint.isActive = true
    }
    
    func setupMyShadow(backgroundCoolor: UIColor){
        self.backgroundColor = backgroundCoolor
        self.layer.cornerRadius = 8

        let firstShadow = CAShapeLayer()
        firstShadow.name = "firstShadow"

        firstShadow.frame = self.bounds
        firstShadow.shadowColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 0.06).cgColor
        firstShadow.shadowOpacity = 1
        firstShadow.shadowRadius = 14
        firstShadow.cornerRadius = self.layer.cornerRadius
        firstShadow.shadowOffset = CGSize(width: 0, height: 10)
        firstShadow.needsDisplayOnBoundsChange = true

        self.layer.insertSublayer(firstShadow, at: 0)


        let perimeterShadow = CAShapeLayer()
        perimeterShadow.name = "perimeterShadow"

        perimeterShadow.frame = self.bounds
        perimeterShadow.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.02).cgColor
        perimeterShadow.shadowRadius = 6
        perimeterShadow.shadowOpacity = 1
        firstShadow.cornerRadius = self.layer.cornerRadius
        perimeterShadow.shadowOffset = CGSize(width: 0, height: -2)
        perimeterShadow.needsDisplayOnBoundsChange = true

        self.layer.insertSublayer(perimeterShadow, at: 1)
    }
}
