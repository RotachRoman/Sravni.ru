//
//  InformationRatePresenter.swift
//  FirstStep
//
//  Created by Rotach Roman on 28.11.2021.
//

import Foundation

final class InformationRatePresenter {

    // MARK: - Private properties -
//unowned
    private weak var view: InformationRateViewControllerType?
    private let interactor: InformationRateInteractorType
    private weak var routerDelegate: InformationRateRouterDelegate?
    
    private var nameAboutInformation: String

    // MARK: - Lifecycle -

    init(interactor: InformationRateInteractorType, routerDelegate: InformationRateRouterDelegate, nameAboutInformation: String) {
//        self.view = view
        self.interactor = interactor
        self.routerDelegate = routerDelegate
        self.nameAboutInformation = nameAboutInformation
    }
}

// MARK: - Extensions -

extension InformationRatePresenter: InformationRatePresenterType {
    func onInformationRatePresenter(on informationRateView: InformationRateViewControllerType){
        self.view = informationRateView
        self.interactor.fetchInformation(aboutName: nameAboutInformation)
    }
    
    func createBullet(){
        let bullet = "\u{2022}"
        var array = ["Ghbbdtn", "What"]
        array = array.map{ bullet + $0 }
    }
}

extension InformationRatePresenter: InformationRateInteractorDelegate {
    func onInformationRateFetched(informationRate: InformationRate) {
        guard let homeView = self.view else {
            assertionFailure("homeView should be present on HomePresenter")
            return
        }
        homeView.onInformationRateFetched(informationRate: informationRate)
    }
    
    
}
