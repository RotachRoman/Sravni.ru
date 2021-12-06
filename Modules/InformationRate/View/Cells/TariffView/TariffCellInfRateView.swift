//
//  TariffCellInfRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 02.12.2021.
//

import Foundation
import UIKit

@available(iOS 10.0, *)
final class TariffCellInfRateView: CellViewHeaderType {
    
    private var cheaperBezier: TariffInformationRateView!
    private var expensivelyBezier: TariffInformationRateView!
    
    init(name: String, cheaperBezier: TariffInformationRateView, expensivelyBezier: TariffInformationRateView) {
        self.cheaperBezier = cheaperBezier
        self.expensivelyBezier = expensivelyBezier
        
        cheaperBezier.translatesAutoresizingMaskIntoConstraints = false
        expensivelyBezier.translatesAutoresizingMaskIntoConstraints = false
        
        let fullHeader = "Минимальный и максимальный " + name.lowercased()
        super.init(header: fullHeader)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        super.addSubviews()
        [cheaperBezier, expensivelyBezier].forEach {
           addSubview($0)
        }
    }
    
    override func addConstraints(){
        super.addConstraints()
        NSLayoutConstraint.activate([
            cheaperBezier.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 16),
            cheaperBezier.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cheaperBezier.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            
            expensivelyBezier.topAnchor.constraint(equalTo: cheaperBezier.topAnchor),
            expensivelyBezier.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            expensivelyBezier.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            cheaperBezier.trailingAnchor.constraint(equalTo: expensivelyBezier.leadingAnchor, constant: -16),
            
            cheaperBezier.heightAnchor.constraint(equalTo: expensivelyBezier.heightAnchor),
            cheaperBezier.widthAnchor.constraint(equalTo: expensivelyBezier.widthAnchor)
        ])
    }
}
