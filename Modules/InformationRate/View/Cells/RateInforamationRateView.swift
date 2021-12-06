//
//  RateInforamationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 05.12.2021.
//

import Foundation
import UIKit

class RateInforamationRateView: CellViewType {
    private lazy var typeRate: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rate: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(type: String, rate: String){
        super.init()
        typeRate.text = "Выш коэфициент " + type
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        super.addSubviews()
        addSubview(typeRate)
    }
    
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            typeRate.topAnchor.constraint(equalTo: self.topAnchor),
            typeRate.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            typeRate.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            typeRate.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -8),
            
            rate.topAnchor.constraint(equalTo: self.topAnchor),
            rate.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            rate.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
