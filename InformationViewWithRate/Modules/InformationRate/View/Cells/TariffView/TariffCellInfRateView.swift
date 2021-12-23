//
//  TariffCellInfRateView.swift
//  FirstStep
//
//  Created by Rotach Roman on 02.12.2021.
//

import Foundation
import UIKit

// MARK: - Две ячейки с тарифом
final class TariffCellInfRateView: CellViewHeaderType {
    
    private var cheaperBezier: TariffInformationRateView!
    private var expensivelyBezier: TariffInformationRateView!
    
    //    MARK: - init -
    init(header: String, cheaperTariff: TariffInformationRateView, expensivelyTariff: TariffInformationRateView) {
        self.cheaperBezier = cheaperTariff
        self.expensivelyBezier = expensivelyTariff
        
        cheaperBezier.translatesAutoresizingMaskIntoConstraints = false
        expensivelyBezier.translatesAutoresizingMaskIntoConstraints = false
    
        let fullHeader = "Минимальный и максимальный " + header.lowercased()
        super.init(header: fullHeader)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        [cheaperBezier, expensivelyBezier].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func addConstraints(){
        let sideConstant: CGFloat = 16
        super.addConstraints()
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24)
        ])

        NSLayoutConstraint.activate([
            cheaperBezier.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 16),
            cheaperBezier.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideConstant),
            cheaperBezier.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
            
            expensivelyBezier.topAnchor.constraint(equalTo: cheaperBezier.topAnchor),
            expensivelyBezier.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
            expensivelyBezier.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideConstant),
            
            cheaperBezier.trailingAnchor.constraint(equalTo: expensivelyBezier.leadingAnchor, constant: -sideConstant),
            
            cheaperBezier.heightAnchor.constraint(equalTo: expensivelyBezier.heightAnchor),
            cheaperBezier.widthAnchor.constraint(equalTo: expensivelyBezier.widthAnchor),
        ])
    }
}
