//
//  InformationRateModel.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 06.12.2021.
//

import Foundation

struct InformationRate: Codable {
    let name, header, headerTitle, staticText: String
    let bullet: [String]
    let minRate, maxRate: Rate
    let indd: Int
}
