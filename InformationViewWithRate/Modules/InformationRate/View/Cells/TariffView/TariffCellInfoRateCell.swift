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
    private var cheaperTariff: TariffInfoRateView?
    private var expensivelyTariff: TariffInfoRateView?
    
    //    MARK: - init -
    
    private func commonInit(cheaperTariff: TariffInfoRateView, expensivelyTariff: TariffInfoRateView){
        self.cheaperTariff = cheaperTariff
        self.expensivelyTariff = expensivelyTariff

        cheaperTariff.translatesAutoresizingMaskIntoConstraints = false
        expensivelyTariff.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        guard let _ = cheaperTariff else { return }
        [cheaperTariff!, expensivelyTariff!].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func addConstraints(){
        let sideConstant: CGFloat = 16
        super.addConstraints()
        guard let cheaperTariff = cheaperTariff,
        let expensivelyTariff = expensivelyTariff
        else { return }
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
    
    func updateWithViewData(viewData: ViewData) {
        super.updateWithViewData(header: viewData.header)
        commonInit(
            cheaperTariff: TariffInfoRateView(text: viewData.cheaperTariff.text, ratio: viewData.cheaperTariff.ratio, sale: viewData.cheaperTariff.sale, backgroundCoolor: viewData.cheaperTariff.backgroundCoolor, saleColor: viewData.cheaperTariff.saleColor),
            expensivelyTariff: TariffInfoRateView(text: viewData.expensivelyTariff.text, ratio: viewData.expensivelyTariff.ratio, sale: viewData.expensivelyTariff.sale, backgroundCoolor: viewData.expensivelyTariff.backgroundCoolor, saleColor: viewData.expensivelyTariff.saleColor))
        self.addSubviews()
        self.addConstraints()
    }
}
