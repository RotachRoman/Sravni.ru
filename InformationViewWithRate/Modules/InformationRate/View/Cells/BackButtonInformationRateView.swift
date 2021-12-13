//
//  BackButtonInformationRateView.swift
//  FirstStep
//
//  Created by Rotach Roman on 04.12.2021.
//

import UIKit

// MARK:  Ячейка "вернуться на главную"
@available(iOS 12.0, *)
class BackButtonInformationRateView: CellViewType {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.kern] = -0.41
        attributes[.font] = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        button.setAttributedTitle(NSMutableAttributedString(string: "Вернуться на главную", attributes: attributes), for: .normal)
        
        if #available(iOS 15.0, *) {
            
            var configuration = UIButton.Configuration.filled()
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 18, leading: 0, bottom: 18, trailing: 0)
            configuration.baseBackgroundColor = UIColor(red: 0, green: 0.686, blue: 1, alpha: 0.06)
            configuration.baseForegroundColor = UIColor(red: 0, green: 0.686, blue: 1, alpha: 1)
            configuration.title = "Вернуться на главную"
            button.configuration = configuration
        } else {
            
            button.setTitleColor(UIColor(red: 0, green: 0.686, blue: 1, alpha: 1), for: .normal)
            button.backgroundColor = UIColor(red: 0, green: 0.686, blue: 1, alpha: 0.06)
            button.contentEdgeInsets = UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 0)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Setup View -
    override func addSubviews(){
        super.addSubviews()
        contentView.addSubview(button)
    }
    
    override func addConstraints(){
        super.addConstraints()
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
