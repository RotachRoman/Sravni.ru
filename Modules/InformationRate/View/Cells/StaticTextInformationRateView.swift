//
//  StaticTextInformationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 05.12.2021.
//

import Foundation

import UIKit

@available(iOS 10.0, *)

class StaticTextInformationRateView: CellViewHeaderType {
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
//    MARK: - Attributed
    private var attributedString: [NSAttributedString.Key: Any] = [NSAttributedString.Key.kern: -0.24]
                
    
    init(text: String){
        super.init(header: "Как определяется?")
        
        let mentionsHighlighted: NSAttributedString = text.wordsHighlighted()
        textLabel.attributedText = mentionsHighlighted
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        super.addSubviews()
        self.addSubview(textLabel)
    }
    
    override func addConstraints(){
        super.addConstraints()
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
