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

@available(iOS 12.0, *)
final class AppRouter {
    private let appViewController: AppViewControllerType
    private let fetchService: InformatioDataFetcherServiceType
    private var editFetchService: EditRateDataFetcherServiceType
    
    private var rateInformRouter: InformationRateRouterType?
    private let nameInformation: String
    
    init(nameInformation: String, appViewController: AppViewControllerType, fetchService: InformatioDataFetcherServiceType, editFetchService: EditRateDataFetcherServiceType) {
        self.appViewController = appViewController
        self.fetchService = fetchService
        self.editFetchService = editFetchService
        self.nameInformation = nameInformation
    }
    
    private func routeToView() {
        self.rateInformRouter = InformationRateRouter(nameInformation: nameInformation, appViewController: self.appViewController, routerDelegate: self, fetchService: fetchService, editFetchService: editFetchService)
        self.rateInformRouter?.startModule()
    }
    
}

@available(iOS 12.0, *)
extension AppRouter: AppRouterType {
    func startApplication() {
        self.routeToView()
    }
}

@available(iOS 12.0, *)
extension AppRouter: InformationRateRouterDelegate { }

