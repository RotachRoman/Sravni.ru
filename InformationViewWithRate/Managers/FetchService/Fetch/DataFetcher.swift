//
//  DataFetcher.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 06.12.2021.
//

import Foundation

protocol DataFetcherProtocol {
    func dataFetcher<T: Decodable>(urlString: String, response: @escaping (T?)-> ())
}

class DataFetcher: DataFetcherProtocol {
    private var getDataService: GetDataService
    init(getDataService: GetDataService) {
        self.getDataService = getDataService
    }
    
    func dataFetcher<T: Decodable>(urlString: String, response: @escaping (T?)-> ()){
        getDataService.dataFetcher(urlString: urlString) { (data, error) in
            if let error = error {
                print(error)
                print("Error received requesting data: \(error.localizedDescription)")
                return
            }
            let decoder = self.decoderJSON(type: T.self, data: data)
            response(decoder)
        }
    }
    
    private func decoderJSON<T: Decodable>(type: T.Type ,data: Data?) -> T? {
        let decoder = JSONDecoder()

        guard let data = data else { return nil }
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch let error as NSError {
            print(error)
            print(error.localizedDescription)
            return nil
        }
    }
}
