//
//  AppRouter.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 06.12.2021.
//

import Foundation

protocol AppRouterType {
    func startApplication()
}

@available(iOS 10.0, *)
final class AppRouter {
    private let appViewController: AppViewControllerType
    private let fetchService: InformatioDataFetcherServiceType
    
    private var rateInformRouter: InformationRateRouterType?
    
    init(appViewController: AppViewControllerType, fetchService: InformatioDataFetcherServiceType) {
        self.appViewController = appViewController
        self.fetchService = fetchService
    }
    
    private func routeToSplash() {
        self.rateInformRouter = InformationRateRouter(appViewController: self.appViewController, routerDelegate: self, fetchService: fetchService)
        self.rateInformRouter?.startModule()
    }
    
}

@available(iOS 10.0, *)
extension AppRouter: AppRouterType {
    func startApplication() {
        self.routeToSplash()
    }
}

@available(iOS 10.0, *)
extension AppRouter: InformationRateRouterDelegate { }

