//
//  BulletInformationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 28.11.2021.
//

import UIKit

@available(iOS 10.0, *)
class BulletInformationRateView: CellViewType {
    
    private lazy var bullet: UILabel = {
        let label = UILabel( )
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(text: [String]){
        super.init()
        bullet.attributedText = updateBullet(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        super.addSubviews()
        self.addSubview(bullet)
    }
   
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            bullet.topAnchor.constraint(equalTo: self.topAnchor),
            bullet.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bullet.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            bullet.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    private func updateBullet(text array: [String]) -> NSAttributedString {
        let bull = "\u{2022}"
        
        let bullArray = array.map { return bull + "\t" + $0 }
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.kern] = -0.24
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 12
        paragraphStyle.headIndent = 4
        attributes[.paragraphStyle] = paragraphStyle
        
        let string = bullArray.joined(separator: "\n")
        return NSAttributedString(string: string, attributes: attributes)
    }
}

