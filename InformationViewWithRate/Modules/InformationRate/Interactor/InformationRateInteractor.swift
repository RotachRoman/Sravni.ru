//
//  InformationRateInteractor.swift
//  FirstStep
//
//  Created by Rotach Roman on 28.11.2021.
//

import Foundation

@available(iOS 12.0, *)
final class InformationRateInteractor {
    private let fetchService: InformatioDataFetcherServiceType
    weak var interatorDelegate: InformationRateInteractorDelegate?
    
    private var informationRate: InformationRate?
    
    init(fetchService: InformatioDataFetcherServiceType){
        self.fetchService = fetchService
    }
}

// MARK: - Extensions -

extension InformationRateInteractor: InformationRateInteractorType {
    func fetchInformation(aboutName name: String){
        fetchService.fetchLocalRate(nameInformation: name) { [weak self] infRate in
            guard let self = self else { return }
            guard let informationRate = infRate else {
                print("Error. informationRate = nil")
                return
            }
            self.informationRate = infRate
            self.interatorDelegate?.onInformationRateFetched(informationRate: informationRate)
        }
    }
    
//    Меняем Rate после выбора коэффициента пользователем
    func changeRate(title: String, urlString: String) {
        fetchRate(urlString: urlString) { [weak self] rate in
            guard let self = self else { return }
            guard let rate = rate else {
                print("Error. Rate = nil")
                return
            }
        // поскольку точно будет существовать informationRate и в нем rate, иначе заход сюда невозможен
            guard let infoRate = self.informationRate?.rate else { return }
            var index = 0
            while(infoRate[index].title != title) {
                index += 1
            }
            self.informationRate!.rate![index].rateCount = rate.rate
            self.informationRate!.rate![index].selectionName = rate.selectionName
            self.interatorDelegate?.onInformationRateFetched(informationRate: self.informationRate!)
        }
    }
    
    private func fetchRate(urlString: String,completionRate: @escaping (GettingRate?) -> ()) {
        let network = LocalService()
        let dataFetcher: DataFetcherProtocol! = DataFetcher(getDataService: network)
        dataFetcher.dataFetcher(urlString: urlString, response: completionRate)
    }
    
    private struct GettingRate: Codable {
        let selectionName: String
        let rate: Double
    }
}
