//
//  InformationRateRouter.swift
//  FirstStep
//
//  Created by Rotach Roman on 28.11.2021.
//

import UIKit

final class InformationRateRouter: InfoRateRouterDelegate {
    
    private weak var appViewController: AppViewControllerType?
    private weak var routerDelegate: InfoRateRouterDelegate?
    private var presenter: (InfoRatePresenterType & InfoRateInteractorDelegate & AddRatePresenterType)?
    
    private var fetchService: InformatioDataFetcherServiceType?
    private var editFetchService: EditRateDataFetcherServiceType?
    private let aboutInformationName: String
    
    init(nameInformation: String, appViewController: AppViewControllerType, routerDelegate: InfoRateRouterDelegate, fetchService: InformatioDataFetcherServiceType, editFetchService: EditRateDataFetcherServiceType) {
        self.appViewController = appViewController
        self.routerDelegate = routerDelegate
        self.fetchService = fetchService
        self.editFetchService = editFetchService
        self.aboutInformationName = nameInformation
    }
}

extension InformationRateRouter: InfoRateRouterType {
    
    func startModule() {
        guard let networkService = self.fetchService else {
            assertionFailure("fetchService should be present on InformationRateRouter")
            return
        }
        guard let editNetworkService = self.editFetchService else {
            assertionFailure("editNetworkService should be present on InformationRateRouter")
            return
        }
        let interactor = InformationRateInteractor(fetchService: networkService, editFetchService: editNetworkService)
        self.presenter = InfoRatePresenter(interactor: interactor, routerDelegate: self, nameAboutInformation: aboutInformationName)
        interactor.interatorDelegate = self.presenter!
        let viewController = InfoRateTableViewController(presenter: presenter!)
        let navigationViewController = UINavigationController(rootViewController: viewController)
        self.appViewController?.updateCurrent(to: navigationViewController)
    }
    
}

extension InformationRateRouter: IRTRouterStartWithSelectedRateProtocol {
    
    func addSelectedRate(title: String, urlString: String){
        presenter?.changeRate(title: title, urlString: urlString)
    }
}

extension InformationRateRouter: InfoRatePresenterRouterDelegate {
    func chooseRate(nameRate: String) {
        let _ = ChooseRateRouter(nameRate: nameRate, backRouter: self)
    }
}
