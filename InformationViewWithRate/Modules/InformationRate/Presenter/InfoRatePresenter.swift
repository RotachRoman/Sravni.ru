//
//  InformationRatePresenter.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 28.11.2021.
//

import Foundation

final class InfoRatePresenter {

    // MARK: - Private properties -
//unowned
    private weak var view: InfoRateViewControllerType?
    private let interactor: InfoRateInteractorType
    private var routerDelegate: InfoRatePresenterRouterDelegate?
    
    private var nameAboutInformation: String
    
    private var viewModels: [ViewDataType] = []

    // MARK: - Lifecycle -
    init(interactor: InfoRateInteractorType, routerDelegate: InfoRatePresenterRouterDelegate, nameAboutInformation: String) {
        self.interactor = interactor
        self.routerDelegate = routerDelegate
        self.nameAboutInformation = nameAboutInformation
    }
}

// MARK: - Extensions -
// загружаем данные для вью
extension InfoRatePresenter: InfoRatePresenterType {
    func onInformationRatePresenter(on informationRateView: InfoRateViewControllerType){
        self.view = informationRateView
        self.interactor.fetchInformation(aboutName: nameAboutInformation)
    }
    func getModelView(for index: Int) -> ViewDataType? {
        return index < getCountView() ? viewModels[index] : nil
    }
    func getCountView() -> Int {
        return viewModels.count
    }
}

// передаем роутеру название ячейки, в которой пользователь хочет поменять коэффициент
extension InfoRatePresenter: СhangeRatePresenterType {
    func changeRate(nameRate name: String) {
        self.routerDelegate?.chooseRate(nameRate: name)
    }
}

// Передает заголовок ячейки в которой меняем коэффициент и ссылку для парсинга
extension InfoRatePresenter: AddRatePresenterType {
    func changeRate(title: String, urlString: String) {
        interactor.changeRate(title: title, urlString: urlString)
    }
}

extension InfoRatePresenter: InfoRateInteractorDelegate {
//    Получение данных и отрисовка вью
    func onInformationRateFetched(informationTariff: InfoTariff) {
        guard let view = self.view else {
            assertionFailure("informationRate should be present on InformationRatePresenter")
            return
        }
        createViewModels(informationTariff: informationTariff)
        view.onInformationRateFetched()
    }
//    Создание моделей вью
    private func createViewModels(informationTariff: InfoTariff){
        let rate = informationTariff.informationRate
        var arrayView: [ViewDataType?] = [
            HeaderViewData(header: rate.name + "- " + rate.header, title: rate.headerTitle, imageName: rate.name),
            StaticTextViewData(header: "Как определяется?", text: rate.staticText)]
        rate.bullet?.forEach{ arrayView.append(BulletViewData(text: $0))}
        arrayView.append(
        TariffsViewData(header: "Минимальный и максимальный " + rate.header.lowercased(),
                        cheaperTariff: TariffViewData(
                            text: rate.minRate.info,
                            ratio: rate.minRate.ratio,
                            sale: rate.minRate.sale,
                            backgroundCoolor: informationTariff.cheaperColor.backgound,
                            saleColor: informationTariff.cheaperColor.sale),
                        
                        expensivelyTariff: TariffViewData(
                            text: informationTariff.informationRate.maxRate.info,
                            ratio: informationTariff.informationRate.maxRate.ratio,
                            sale: informationTariff.informationRate.maxRate.sale,
                            backgroundCoolor: informationTariff.expensivelyColor.backgound,
                            saleColor: informationTariff.expensivelyColor.sale)))
        
        arrayView.append(ButtonHeaderViewData(title: "Узнайте свой " + rate.header.lowercased()))
        if rate.note != nil {
            arrayView.append(NoteViewData(title: rate.note!.title, text: rate.note!.text))
        }
        rate.rate?.forEach { arrayView.append(
            ButtonChangeTariffViewData(presenter: self, title: $0.title, rateSelection: $0.selectionName)
        )}
        var currency: Double = 0
        rate.rate?.forEach { currency += $0.rateCount ?? 0 }
        if currency != 0 {
            arrayView.append(RateInfoViewData(title: "Ваш коэфициент " + rate.name, rate: "×" + String(describing: currency)))
        }
        viewModels = arrayView.filter{ $0 != nil } as! [ViewDataType]
    }
}
