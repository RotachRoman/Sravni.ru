//
//  GetRate.swift
//  FirstStep
//
//  Created by Rotach Roman on 12.12.2021.
//

import Foundation

@available(iOS 12.0, *)
struct GettingRate: Codable {
    let selectionName: String
    let rate: Double
}

@available(iOS 12.0, *)
class GetRate{
    func fetchRate(completionRate: @escaping (GettingRate?) -> ()) {
        let network = LocalService()
        let dataFetcher: DataFetcherProtocol! = DataFetcher(getDataService: network)
        let urlString = "GetRate"
        dataFetcher.dataFetcher(urlString: urlString, response: completionRate)
    }
}
