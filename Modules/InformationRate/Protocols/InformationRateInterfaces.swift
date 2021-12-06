//
//  InformationRateInterfaces.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 28.11.2021.
//

import UIKit

protocol PresenterInformationRouterType {
    func startModule()
}

//MARK: - Router
protocol InformationRateRouterType: AnyObject {
    func startModule()
//    init(appViewController: AppViewControllerType, routerDelegate: InformationRateRouterDelegate)
}

protocol InformationRateRouterDelegate: AnyObject {
//    func routeToHome()
}


//MARK: - View
protocol InformationRateViewControllerType: AnyObject {
    func onInformationRateFetched(informationRate: InformationRate)
}

//MARK: - Presenter
protocol InformationRatePresenterType: AnyObject {
    func onInformationRatePresenter(on informationRateView: InformationRateViewControllerType)
}


//MARK: - Interactor
protocol InformationRateInteractorType: AnyObject {
    var interatorDelegate: InformationRateInteractorDelegate? { get set }
    func fetchInformation(aboutName: String)
}

protocol InformationRateInteractorDelegate: AnyObject {
    func onInformationRateFetched(informationRate: InformationRate)
}
