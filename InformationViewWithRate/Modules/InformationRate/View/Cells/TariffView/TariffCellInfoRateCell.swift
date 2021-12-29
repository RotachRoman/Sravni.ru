//
//  TariffCellInfRateCell.swift
//  FirstStep
//
//  Created by Rotach Roman on 02.12.2021.
//

import Foundation
import UIKit

// MARK: - Две ячейки с тарифом
final class TariffCellInfoRateCell: CellViewHeaderType {
    private lazy var cheaperTariff: TariffInfoRateView = {
        let tariff = TariffInfoRateView()
        tariff.translatesAutoresizingMaskIntoConstraints = false
        return tariff
    }()
    private var expensivelyTariff: TariffInfoRateView = {
        let tariff = TariffInfoRateView()
        tariff.translatesAutoresizingMaskIntoConstraints = false
        return tariff
    }()
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        [cheaperTariff, expensivelyTariff].forEach {
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
            cheaperTariff.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 16),
            cheaperTariff.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideConstant),
            cheaperTariff.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
            
            expensivelyTariff.topAnchor.constraint(equalTo: cheaperTariff.topAnchor),
            expensivelyTariff.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
            expensivelyTariff.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideConstant),
            
            cheaperTariff.trailingAnchor.constraint(equalTo: expensivelyTariff.leadingAnchor, constant: -sideConstant),
            
            cheaperTariff.heightAnchor.constraint(equalTo: expensivelyTariff.heightAnchor),
            cheaperTariff.widthAnchor.constraint(equalTo: expensivelyTariff.widthAnchor),
        ])
    }
}
//MARK: - Updatable
extension TariffCellInfoRateCell: Updatable {
    typealias ViewData = TariffsViewData
    
    func updateWithViewData(_ viewData: ViewData) {
        super.updateWithViewData(header: viewData.header)
        cheaperTariff.updateWithViewData(viewData.cheaperTariff)
        expensivelyTariff.updateWithViewData(viewData.expensivelyTariff)
        self.addSubviews()
        self.addConstraints()
    }
}
