//
//  InformationRateRouter.swift
//  FirstStep
//
//  Created by Rotach Roman on 28.11.2021.
//

import UIKit

@available(iOS 12.0, *)
final class InformationRateRouter: InformationRateRouterDelegate {
    
    private let arrayJSON = ["BT", "KM", "KO", "KVC"]
    
    private weak var appViewController: AppViewControllerType?
    private weak var routerDelegate: InformationRateRouterDelegate?
    private weak var viewController: UIViewController?
    private weak var presenter: InformationRatePresenter?
    
//    MARK: weak var ошибка  'weak' must not be applied to non-class-bound 'InformatioDataFetcherServiceType'; consider adding a protocol conformance that has a class bound
    private var fetchService: InformatioDataFetcherServiceType
//    private weak var
    private let aboutInformationName: String!
    
    init(appViewController: AppViewControllerType, routerDelegate: InformationRateRouterDelegate, fetchService: InformatioDataFetcherServiceType) {
        self.appViewController = appViewController
        self.routerDelegate = routerDelegate
        self.fetchService = fetchService
        self.aboutInformationName = self.arrayJSON[3]
    }
}

extension InformationRateRouter: InformationRateRouterType {
    
    func startModule() {
        let interactor = InformationRateInteractor(fetchService: fetchService)
        presenter = InformationRatePresenter(interactor: interactor, routerDelegate: self, nameAboutInformation: aboutInformationName)
        interactor.interatorDelegate = presenter
        let viewController = InformationRateTableViewController(presenter: presenter!)
        self.viewController = viewController
        self.appViewController?.updateCurrent(to: viewController)
    }
}

extension InformationRateRouter: IRTRouterStartWithSelectedRateProtocol {
    func addSelectedRate(title: String, urlString: String){
        self.presenter?.changeRate(title: title, urlString: urlString)
    }
}

extension InformationRateRouter: InformationRatePresenterRouterDelegate {
    func chooseRate(nameRate: String) {
        let _ = ChooseRateRouter(nameRate: nameRate, backRouter: self)
//        viewController
    }
}

//extension InformationRateRouter: RateGettingRouterType {
//    func returnRate(completionRate: @escaping (Double?) -> ()) {
//
//    }
    
    
