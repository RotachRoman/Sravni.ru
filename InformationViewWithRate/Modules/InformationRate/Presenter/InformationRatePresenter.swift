//
//  InformationRatePresenter.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 28.11.2021.
//

import Foundation

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
        self.interactor = interactor
        self.routerDelegate = routerDelegate
        self.nameAboutInformation = nameAboutInformation
        self.creatorViewFromCells = CrateInformationRateViewFromCell(presenter: self)
    }
}

// MARK: - Extensions -
// загружаем данные для вью
extension InformationRatePresenter: InformationRatePresenterType {
    func onInformationRatePresenter(on informationRateView: InformationRateViewControllerType){
        self.view = informationRateView
        self.interactor.fetchInformation(aboutName: nameAboutInformation)
    }
}

// передаем роутеру название ячейки, в которой пользователь хочет поменять коэффициент
extension InformationRatePresenter: СhangeRatePresenterType {
    func changeRate(nameRate name: String) {
        self.routerDelegate?.chooseRate(nameRate: name)
    }
}

// Передает заголовок ячейки в которой меняем коэффициент и ссылку для парсинга
extension InformationRatePresenter: AddRatePresenterType {
    func changeRate(title: String, urlString: String) {
        interactor.changeRate(title: title, urlString: urlString)
    }
}

extension InformationRatePresenter: InformationRateInteractorDelegate {
//    Получение данных и отрисовка вью
    func onInformationRateFetched(informationTariff: InformationTariff) {
        guard let view = self.view else {
            assertionFailure("informationRate should be present on InformationRatePresenter")
            return
        }
        let cells = createCells(informationTariff: informationTariff)
        view.onInformationRateFetched(cells: cells)
    }
//    Создание вью из ячеек
    private func createCells(informationTariff: InformationTariff) -> [CellViewType] {
        return creatorViewFromCells!.addCells(informationTariff: informationTariff)
    }
}
