//
//  RateModel.swift
//  FirstStep
//
//  Created by Rotach Roman on 06.12.2021.
//

import Foundation

struct Rate: Codable {
    let ratio, info: String
    let sale: String?
    var colors: TariffColor?
}
