//
//  InformationRateRouter.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 28.11.2021.
//

import UIKit

final class InformationRateRouter {
    
    private weak var appViewController: AppViewControllerType?
    private weak var routerDelegate: InformationRateRouterDelegate?
    private weak var viewController: UIViewController?
    
//    MARK: weak var ошибка  'weak' must not be applied to non-class-bound 'InformatioDataFetcherServiceType'; consider adding a protocol conformance that has a class bound
    private var fetchService: InformatioDataFetcherServiceType
//    private weak var
    private let aboutInformationName = "BT"
    
    init(appViewController: AppViewControllerType, routerDelegate: InformationRateRouterDelegate, fetchService: InformatioDataFetcherServiceType) {
        self.appViewController = appViewController
        self.routerDelegate = routerDelegate
        self.fetchService = fetchService
    }
}

extension InformationRateRouter: InformationRateRouterType {
    
    func startModule() {
        let interactor = InformationRateInteractor(fetchService: fetchService)
        let presenter = InformationRatePresenter(interactor: interactor, routerDelegate: self, nameAboutInformation: aboutInformationName)
        interactor.interatorDelegate = presenter
        let viewController = InformationRateViewController(presenter: presenter)
        self.viewController = viewController
        self.appViewController?.updateCurrent(to: viewController)
    }
    
}

extension InformationRateRouter: InformationRateRouterDelegate {
    
}
