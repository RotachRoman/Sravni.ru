//
//  CrateInformationRateViewFromCell.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 10.12.2021.
//

import Foundation

//MARK: Create View из ячеек
final class CrateInformationRateViewFromCell: CreateInformationRateCellAlgoritm {
    
    //  MARK: - header с картинкой и title
    override func addHeader() -> CellViewType? {
        return HeaderInformationRateView(header: informationTariff.informationRate.name + "- " + informationTariff.informationRate.header, title: informationTariff.informationRate.headerTitle, imageName: informationTariff.informationRate.name)
    }
    
    //MARK: - ячейка статичного текста
    override func addStaticText() -> CellViewType? {
        return StaticTextInformationRateView(text: informationTariff.informationRate.staticText)
    }
    
    //MARK: - ячейка для списка с буллитами
    override func addBulletCell() -> [CellViewType] {
        var cells: [CellViewType] = []
        if let bullets = informationTariff.informationRate.bullet {
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
        let cheaperTariff =  TariffInformationRateView(text: informationTariff.informationRate.minRate.info,
                                    ratio: informationTariff.informationRate.minRate.ratio,
                                    sale: informationTariff.informationRate.minRate.sale,
                                    backgroundCoolor: informationTariff.cheaperColor.backgound,
                                    saleColor: informationTariff.cheaperColor.sale)
        
        let expensivelyTariff = TariffInformationRateView(text: informationTariff.informationRate.maxRate.info,
                                    ratio: informationTariff.informationRate.maxRate.ratio,
                                    sale: informationTariff.informationRate.maxRate.sale,
                                    backgroundCoolor: informationTariff.expensivelyColor.backgound,
                                    saleColor: informationTariff.expensivelyColor.sale)
        
        //        MARK: - имя или заголовок, путаница
        let bezierView = TariffCellInfRateView(header: informationTariff.informationRate.header, cheaperTariff: cheaperTariff, expensivelyTariff: expensivelyTariff)
        return bezierView
    }
    
    // MARK: - информационная ячейка "Равновесие"
    override func addNoteCell() -> CellViewType? {
        guard let note = informationTariff.informationRate.note else { return nil }
        return BalanceInformationRateView(title: note.title, text: note.text)
    }
    
    //MARK: - ячейка выбора коэффициента
    override func addRateButton() -> [CellViewType] {
        guard let rates = informationTariff.informationRate.rate else { return [] }
        var cells: [CellViewType] = []
        cells.append(HeaderSelectButtonInformationRateCell(header: informationTariff.informationRate.header))
        
        guard let presenter = presenter else { return [] }
        for rate in rates {
            cells.append(ButtonRateCell(presenter: presenter, title: rate.title, rateSelection: rate.selectionName))
        }
        return cells
    }
    
    //MARK: - ячейка коэффициента
    override func addRateInformation() -> CellViewType? {
        guard let infoRate = informationTariff.informationRate.rate else { return nil }
        //        Поскольку Presenter отвечает за предстваление переменных во вью, то мы высчитываем здесь коэффициент пользователя
        if let _ = infoRate.first (where: { $0.rateCount != nil}) {
            var currency: Double = 0
            for rate in informationTariff.informationRate.rate! {
                currency += rate.rateCount ?? 0
            }
            return RateInforamationRateView(nameRate: informationTariff.informationRate.name, rate: String(currency))
        }
        return nil
    }
}
