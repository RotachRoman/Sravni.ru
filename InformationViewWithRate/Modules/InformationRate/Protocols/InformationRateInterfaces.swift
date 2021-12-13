//
//  InformationRateInterfaces.swift
//  FirstStep
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
}

protocol IRTRouterStartWithSelectedRateProtocol: AnyObject {
    func addSelectedRate(title: String, urlString: String)
}

protocol InformationRatePresenterRouterDelegate: AnyObject {
    func chooseRate(nameRate: String)
}


protocol InformationRateRouterDelegate: AnyObject {
    
}

//MARK: - View
protocol InformationRateViewControllerType: AnyObject {
    func onInformationRateFetched(cells: [CellViewType])
}
//Функция по переходу на новый view по нажатию на ячейку выбора коэффициета
protocol RateButtonViewCellDelegate: AnyObject {
    
}

//MARK: - Presenter
protocol InformationRatePresenterType: AnyObject {
    func onInformationRatePresenter(on informationRonChooseRateTappedateView: InformationRateViewControllerType)
}

//Переход на новый view по нажатию на ячейку выбора коэффициета
protocol СhangeRatePresenterType: AnyObject {
    func changeRate(nameRate: String)
}

protocol AddRatePresenterType: AnyObject {
    func changeRate(title: String, urlString: String)
}

//MARK: - Interactor
protocol InformationRateInteractorType: AnyObject {
    var interatorDelegate: InformationRateInteractorDelegate? { get set }
    func fetchInformation(aboutName: String)
    func changeRate(title: String, urlString: String)
}

protocol InformationRateInteractorDelegate: AnyObject {
    func onInformationRateFetched(informationRate: InformationRate)
}

