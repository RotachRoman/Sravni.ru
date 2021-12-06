//
//  InformationRateInteractor.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 28.11.2021.
//

import Foundation

final class InformationRateInteractor {
    private let fetchService: InformatioDataFetcherServiceType
    weak var interatorDelegate: InformationRateInteractorDelegate?
    
    init(fetchService: InformatioDataFetcherServiceType){
        self.fetchService = fetchService
    }
}

// MARK: - Extensions -

extension InformationRateInteractor: InformationRateInteractorType {
    func fetchInformation(aboutName name: String){
        fetchService.fetchLocalRate(nameInformation: name) { [unowned self] infRate in
            guard let informationRate = infRate else {
                print("Error. Curency network = nil. (func in: fillingCurrencyManager")
                return
            }
            print(informationRate)
            interatorDelegate?.onInformationRateFetched(informationRate: informationRate)
        }
    }
}
