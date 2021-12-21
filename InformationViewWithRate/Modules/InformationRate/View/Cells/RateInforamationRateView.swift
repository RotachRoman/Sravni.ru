//
//  RateInforamationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 05.12.2021.
//

import Foundation
import UIKit

//MARK: Ячейка отображения коэффициента
class RateInforamationRateView: CellViewType {
    
    //    MARK: - UI elements
    private lazy var ourRate: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.41])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rate: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0.686, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .right
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.24])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - init -
    init(nameRate: String, rate: String){
        super.init()
        ourRate.text = "Ваш коэфициент " + nameRate
        self.rate.text = "×" + rate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        contentView.addSubview(ourRate)
        contentView.addSubview(rate)
    }
    
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            ourRate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
            ourRate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            ourRate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            ourRate.trailingAnchor.constraint(lessThanOrEqualTo: rate.trailingAnchor, constant: -12),
            
            rate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 29),
            rate.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            rate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32)
        ])
    }
}
