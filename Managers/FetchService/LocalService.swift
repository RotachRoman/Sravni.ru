//
//  LocalService.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 06.12.2021.
//

import Foundation

protocol GetDataService {
    func dataFetcher(urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

class LocalService: GetDataService {
    func dataFetcher(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        
        do {
            guard let bundlePath = Bundle.main.path(forResource: urlString, ofType: "json") else {
                print("Error: adress not url")
                return
            }
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
            DispatchQueue.main.async {
                completion(jsonData, nil)
            }
            return
        }
        catch {
            print(error)
            completion(nil, error)
        }
    }
}
    
