//
//  RateDataFetcherService.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 16.12.2021.
//

import Foundation

protocol EditRateDataFetcherServiceType {
    func fetchLocalRate(urlString: String, completion: @escaping (EditRate?) -> ())
}

class EditRateDataFetcherService: EditRateDataFetcherServiceType {
    var dataFetcher: DataFetcherProtocol!
    
    init(dataFetcher: DataFetcherProtocol = DataFetcher(getDataService: LocalService())){
        self.dataFetcher = dataFetcher
    }
    
    func fetchLocalRate(urlString: String, completion: @escaping (EditRate?) -> ()) {
            let network = LocalService()
            let dataFetcher: DataFetcherProtocol! = DataFetcher(getDataService: network)
            dataFetcher.dataFetcher(urlString: urlString, response: completion)
    }
}
