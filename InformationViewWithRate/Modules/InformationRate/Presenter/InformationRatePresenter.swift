//
//  InformationRatePresenter.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 28.11.2021.
//

import Foundation
import UIKit

@available(iOS 12.0, *)
final class InformationRatePresenter {

    // MARK: - Private properties -
//unowned
    private weak var view: InformationRateViewControllerType?
    private let interactor: InformationRateInteractorType
    private var routerDelegate: InformationRatePresenterRouterDelegate?
    
    private var nameAboutInformation: String
    
//    MARK:  Должно ли это быть здесь?
    private var creatorViewFromCells: CreateInformationRateCellAlgoritm?

    // MARK: - Lifecycle -

    init(interactor: InformationRateInteractorType, routerDelegate: InformationRatePresenterRouterDelegate, nameAboutInformation: String) {
//        self.view = view
        self.interactor = interactor
        self.routerDelegate = routerDelegate
        self.nameAboutInformation = nameAboutInformation
        self.creatorViewFromCells = CrateInformationRateViewFromCell(presenter: self)
    }
}

// MARK: - Extensions -
@available(iOS 12.0, *)
extension InformationRatePresenter: InformationRatePresenterType {
    func onInformationRatePresenter(on informationRateView: InformationRateViewControllerType){
        self.view = informationRateView
        self.interactor.fetchInformation(aboutName: nameAboutInformation)
    }
}

@available(iOS 12.0, *)
extension InformationRatePresenter: СhangeRatePresenterType {
    func changeRate(nameRate name: String) {
        self.routerDelegate?.chooseRate(nameRate: name)
    }
}

@available(iOS 12.0, *)
extension InformationRatePresenter: AddRatePresenterType {
    func changeRate(title: String, urlString: String) {
        interactor.changeRate(title: title, urlString: urlString)
    }
}

@available(iOS 12.0, *)
extension InformationRatePresenter: InformationRateInteractorDelegate {
//    Получение данных и отрисовка вью
    func onInformationRateFetched(informationRate: InformationRate) {
        guard let view = self.view else {
            assertionFailure("informationRate should be present on InformationRatePresenter")
            return
        }
        let cells = createCells(informationRate: informationRate)
        view.onInformationRateFetched(cells: cells)
    }
//    Создание вью из ячеек
    private func createCells(informationRate: InformationRate) -> [CellViewType] {
        return creatorViewFromCells!.addCells(informationRate: informationRate)
    }
}
