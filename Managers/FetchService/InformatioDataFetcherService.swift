//
//  InformatioDataFetcherService.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 06.12.2021.
//

import Foundation

protocol InformatioDataFetcherServiceType {
    func fetchLocalRate(nameInformation: String, completion: @escaping (InformationRate?) -> ())
}

class InformatioDataFetcherService: InformatioDataFetcherServiceType {
    var dataFetcher: DataFetcherProtocol!
    
    init(dataFetcher: DataFetcherProtocol = DataFetcher(getDataService: LocalService())){
        self.dataFetcher = dataFetcher
    }
    
    func fetchLocalRate(nameInformation name: String, completion: @escaping (InformationRate?) -> ()){
        let urlString = name + "Information"
        dataFetcher.dataFetcher(urlString: urlString, response: completion)
    }
}
