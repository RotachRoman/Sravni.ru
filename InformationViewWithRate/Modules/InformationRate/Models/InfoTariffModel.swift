//
//  InformationTariffModel.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 21.12.2021.
//

import Foundation

struct InfoTariff {
    var informationRate: InformationRate
    let cheaperColor, expensivelyColor: TariffColors
    
    init(informationRate: InformationRate){
        self.informationRate = informationRate
        self.cheaperColor = TariffColor.cheaper.color
        self.expensivelyColor = TariffColor.expensively.color
    }
}
