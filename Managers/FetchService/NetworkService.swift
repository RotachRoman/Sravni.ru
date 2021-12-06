//
//  NetworkService.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 06.12.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func dataFetcher(urlString: String, comletion: @escaping (Data?, Error?) -> ())
}

class NetworkService: NetworkServiceProtocol {
    
    func dataFetcher(urlString: String, comletion: @escaping (Data?, Error?) -> ()){
        guard let url = URL(string: urlString) else {
            print("Error: adress not url")
            return
        }
        let request = URLRequest(url: url)
        createDataTask(request: request, completion: comletion)
    }
    
    private func createDataTask(request: URLRequest, completion: @escaping (Data?, Error?) -> ()){
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
    }
}
