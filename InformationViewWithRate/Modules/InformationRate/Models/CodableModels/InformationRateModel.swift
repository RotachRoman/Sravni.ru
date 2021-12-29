//
//  InformationRateModel.swift
//  FirstStep
//
//  Created by Rotach Roman on 06.12.2021.
//

import Foundation

struct InformationRate: Codable {
    let name: String
    let header: String
    let headerTitle: String
    let staticText: String
    let note: Note?
    let bullet: [String]?
    let minRate, maxRate: Rate
    var rate: [RateCalculate]?
}
