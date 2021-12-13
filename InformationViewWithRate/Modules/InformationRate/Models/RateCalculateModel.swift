//
//  RateCalculateModel.swift
//  FirstStep
//
//  Created by Rotach Roman on 11.12.2021.
//

import Foundation

struct RateCalculate: Codable {
    //    defaultRateSelection стандартное значение выбранной ячейки, поскольу в следущем экране будут получены данные "коэффициентов"
    let title: String
    var selectionName: String?
    var rate: Double
}
