//
//  BackButtonInformationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 04.12.2021.
//

import UIKit

@available(iOS 10.0, *)
class BackButtonInformationRateView: UIView {
    
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
    
    
    init(){
        super.init(frame: .zero)
        setupSubview()
        setupConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews(){
        super.layoutSubviews()
        setupConstraints()
    }
    
    override func updateConstraints(){
        setupConstraints()
        super.updateConstraints()
    }
    
    func setupSubview(){
        addSubview(button)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
