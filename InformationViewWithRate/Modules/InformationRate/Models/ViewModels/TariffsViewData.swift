//
//  TariffViewData.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 25.12.2021.
//

import Foundation

struct TariffsViewData: ViewDataType {
    let header: String
    let cheaperTariff, expensivelyTariff: TariffViewData
}
