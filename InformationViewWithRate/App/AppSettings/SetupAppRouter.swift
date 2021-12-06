//
//  SetupAppRouter.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 06.12.2021.
//

import Foundation
import UIKit

protocol SetupAppRouterType {
    init(window: UIWindow?)
    func getAppRouter() -> AppRouterType?
}

@available(iOS 10.0, *)
final class SetupAppRouter: SetupAppRouterType{
    private var window: UIWindow?
    private var appRouter: AppRouterType?
    
    required init(window: UIWindow?){
        self.window = window
        setup()
    }
    
    func getAppRouter() -> AppRouterType? {
        return appRouter
    }
    
    private func setup() {
        let viewController = setupViewController
        let fetchInformationRate = InformatioDataFetcherService()
        self.appRouter = AppRouter(appViewController: viewController(), fetchService: fetchInformationRate)
        self.appRouter?.startApplication()
    }
    
    private func setupViewController() -> AppViewControllerType {
        let viewController = AppViewController(nibName: nil, bundle: nil)
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        return viewController
    }
}
