//
//  CrateInformationRateViewFromCell.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 10.12.2021.
//

import UIKit

//MARK: Create View из ячеек
@available(iOS 12.0, *)
final class CrateInformationRateViewFromCell: CreateInformationRateCellAlgoritm {
    
    //  MARK: - header с картинкой и title
    override func addHeader() -> CellViewType? {
        return HeaderInformationRateView(header: informationRate.name + "- " + informationRate.header, title: informationRate.headerTitle, imageName: informationRate.name)
    }
    
    //MARK: - ячейка статичного текста
    override func addStaticText() -> CellViewType? {
        return StaticTextInformationRateView(text: informationRate.staticText)
    }
    
    //MARK: - ячейка для списка с буллитами
    override func addBulletCell() -> [CellViewType] {
        var cells: [CellViewType] = []
        if let bullets = informationRate.bullet {
            for bullet in bullets {
                cells.append(BulletInformationRateView(text: bullet))
            }
            return cells
        } else {
            return []
        }
    }
    
    // MARK: - ячейка с тарифом
    override func addTariffCell() -> CellViewType? {
//        MARK: - Убрать отсюда цвета
        let cheaperTariff =  TariffInformationRateView(text: informationRate.minRate.info,
                                    ratio: informationRate.minRate.ratio,
                                    sale: informationRate.minRate.sale,
                                    backgroundCoolor: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                                    saleColor: UIColor(red: 0.051, green: 0.82, blue: 0.286, alpha: 1))
        let expensivelyTariff = TariffInformationRateView(text: informationRate.maxRate.info,
                                    ratio: informationRate.maxRate.ratio,
                                    sale: informationRate.maxRate.sale,
                                    backgroundCoolor: UIColor(red: 0.984, green: 0.945, blue: 0.945, alpha: 1),
                                    saleColor: UIColor(red: 0.757, green: 0.114, blue: 0.114, alpha: 1))
        
        //        MARK: - имя или заголовок, путаница
        let bezierView = TariffCellInfRateView(header: informationRate.header, cheaperTariff: cheaperTariff, expensivelyTariff: expensivelyTariff)
        return bezierView
    }
    
    // MARK: - информационная ячейка "Равновесие"
    override func addNoteCell() -> CellViewType? {
        guard let note = informationRate.note else { return nil }
        return BalanceInformationRateView(title: note.title, text: note.text)
    }
    
    //MARK: - ячейка выбора коэффициента
    override func addRateButton() -> [CellViewType] {
        guard let rates = informationRate.rate else { return [] }
        var cells: [CellViewType] = []
        cells.append(HeaderSelectButtonInformationRateCell(header: informationRate.header))
        
        for rate in rates {
            cells.append(ButtonRateCell(presenter: presenter, title: rate.title, rateSelection: rate.selectionName))
        }
        return cells
    }
    
    override func addRateInformation() -> CellViewType? {
        guard let infoRate = informationRate.rate else { return nil }
        //        Поскольку Presenter отвечает за предстваление переменных во вью, то мы высчитываем здесь коэффициент пользователя
        if let _ = infoRate.first (where: { coefficient in
            if coefficient.rateCount != nil {
                return true
            } else { return false }
        }) {
            var currency: Double = 0
            for rate in informationRate.rate! {
                currency += rate.rateCount ?? 0
            }
            return RateInforamationRateView(nameRate: informationRate.name, rate: String(currency))
        }
        return nil
    }
}
