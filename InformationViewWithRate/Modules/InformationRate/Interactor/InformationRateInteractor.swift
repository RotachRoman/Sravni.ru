//
//  InformationRateInteractor.swift
//  FirstStep
//
//  Created by Rotach Roman on 28.11.2021.
//

import Foundation

final class InformationRateInteractor {
    private let fetchService: InformatioDataFetcherServiceType
    private let editFetchService: EditRateDataFetcherServiceType
    weak var interatorDelegate: InfoRateInteractorDelegate?
    
    private var tariff: InfoTariff?
    
    init(fetchService: InformatioDataFetcherServiceType, editFetchService: EditRateDataFetcherServiceType){
        self.fetchService = fetchService
        self.editFetchService = editFetchService
    }
}

// MARK: - Extensions -

// получение основных данных для вью
extension InformationRateInteractor: InfoRateInteractorType {
    func fetchInformation(aboutName name: String){
        fetchService.fetchLocalRate(nameInformation: name) { [weak self] infRate in
            guard let self = self else { return }
            guard let informationRate = infRate else {
                print("Error. informationRate = nil")
                return
            }
            let tariff = InfoTariff(informationRate: informationRate)
            self.tariff = tariff
//            Отправление данных презентеру для дальнейшего отображения
            self.interatorDelegate?.onInformationRateFetched(informationTariff: tariff)
        }
    }
    
//    Меняем Rate после выбора коэффициента пользователем
    func changeRate(title: String, urlString: String) {
        editFetchService.fetchLocalRate(urlString: urlString) { [weak self] rate in
            guard let self = self else { return }
            guard let rate = rate else {
                print("Error. Rate = nil")
                return
            }
            if let row = self.tariff?.informationRate.rate!.firstIndex(where: {$0.title == title}) {
                self.tariff?.informationRate.rate![row].rateCount = rate.rate
                self.tariff?.informationRate.rate![row].selectionName = rate.selectionName
            }
//            Отправление данных презентеру для дальнейшего отображения
            self.interatorDelegate?.onInformationRateFetched(informationTariff: self.tariff!)
        }
    }
}
