//
//  BalanceInformationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 05.12.2021.
//

import UIKit

class BalanceInformationRateView: CellViewType {
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var text: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.font = UIFont(name: "OpenSans-Regular", size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(title: String, text: String){
        super.init()
        self.layer.backgroundColor = UIColor(red: 0.957, green: 0.969, blue: 0.984, alpha: 1).cgColor
        self.layer.cornerRadius = 10
//        self.layer.
        
        self.title.attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.kern: -0.41])
        self.text.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        super.addSubviews()
        addSubview(title)
        addSubview(text)
    }
    
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -16),
            
            text.topAnchor.constraint(equalTo: title.topAnchor, constant: 8),
            text.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            text.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            text.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
}
