//
//  InformationRateRouter.swift
//  FirstStep
//
//  Created by Rotach Roman on 28.11.2021.
//

import UIKit

final class InformationRateRouter: InformationRateRouterDelegate {
    
    private weak var appViewController: AppViewControllerType?
    private weak var routerDelegate: InformationRateRouterDelegate?
    private weak var viewController: UIViewController?
    private var presenter: (InformationRatePresenterType & InformationRateInteractorDelegate & AddRatePresenterType)?
    
    private var fetchService: InformatioDataFetcherServiceType
    private var editFetchService: EditRateDataFetcherServiceType
    private let aboutInformationName: String
    
    init(nameInformation: String, appViewController: AppViewControllerType, routerDelegate: InformationRateRouterDelegate, fetchService: InformatioDataFetcherServiceType, editFetchService: EditRateDataFetcherServiceType) {
        self.appViewController = appViewController
        self.routerDelegate = routerDelegate
        self.fetchService = fetchService
        self.editFetchService = editFetchService
        self.aboutInformationName = nameInformation
    }
}

@available(iOS 12.0, *)
extension InformationRateRouter: InformationRateRouterType {
    
    func startModule() {
        let interactor = InformationRateInteractor(fetchService: fetchService, editFetchService: editFetchService)
        self.presenter = InformationRatePresenter(interactor: interactor, routerDelegate: self, nameAboutInformation: aboutInformationName)
        interactor.interatorDelegate = self.presenter!
        let viewController = InformationRateTableViewController(presenter: presenter!)
        self.viewController = viewController
        self.appViewController?.updateCurrent(to: viewController)
    }
    
}

@available(iOS 12.0, *)
extension InformationRateRouter: IRTRouterStartWithSelectedRateProtocol {
    
    func addSelectedRate(title: String, urlString: String){
        presenter?.changeRate(title: title, urlString: urlString)
    }
}

@available(iOS 12.0, *)
extension InformationRateRouter: InformationRatePresenterRouterDelegate {
    func chooseRate(nameRate: String) {
        let _ = ChooseRateRouter(nameRate: nameRate, backRouter: self)
    }
}
