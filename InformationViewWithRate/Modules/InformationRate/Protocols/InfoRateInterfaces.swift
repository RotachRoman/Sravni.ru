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
protocol InfoRateRouterType: AnyObject {
    func startModule()
}

protocol IRTRouterStartWithSelectedRateProtocol: AnyObject {
    func addSelectedRate(title: String, urlString: String)
}

protocol InfoRatePresenterRouterDelegate: AnyObject {
    func chooseRate(nameRate: String)
}


protocol InfoRateRouterDelegate: AnyObject {
    
}

//MARK: - View
protocol InfoRateViewControllerType: AnyObject {
    func onInformationRateFetched()
}

//MARK: Cell
protocol Updatable: AnyObject {
    associatedtype ViewData
    func updateWithViewData(_ viewData: ViewData)
}

protocol CellConfiguratorType {
    var reuseIdentifier: String { get }
    var cellClass: AnyClass { get }

    func updateCell(cell: UITableViewCell)
}

//MARK: - Presenter
protocol InfoRatePresenterType: AnyObject {
    func onInformationRatePresenter(on infoRonChooseRateTappedateView: InfoRateViewControllerType)
    func getModelView(for index: Int) -> ViewDataType?
    func getCountView() -> Int
}

//Переход на новый view по нажатию на ячейку выбора коэффициета
protocol СhangeRatePresenterType: AnyObject {
    func changeRate(nameRate: String)
}

protocol AddRatePresenterType: AnyObject {
    func changeRate(title: String, urlString: String)
}

//MARK: - Interactor
protocol InfoRateInteractorType: AnyObject {
    var interatorDelegate: InfoRateInteractorDelegate? { get set }
    func fetchInformation(aboutName: String)
    func changeRate(title: String, urlString: String)
}

protocol InfoRateInteractorDelegate: AnyObject {
    func onInformationRateFetched(informationTariff: InfoTariff)
}

struct CellConfigurator<Cell> where Cell: Updatable, Cell: CellViewType {

    let viewData: Cell.ViewData
    let reuseIdentifier: String = NSStringFromClass(Cell.self)
    let cellClass: AnyClass = Cell.self
    
    func updateCell(cell: UITableViewCell) {
        if let cell = cell as? Cell {
            cell.updateWithViewData(viewData)
        }
    }
}


protocol CellConfiguratorProtocol {
    var reuseIdentifier: String { get }
    var cellClass: AnyClass { get }

    func updateCell(cell: UITableViewCell)
}

extension CellConfigurator: CellConfiguratorProtocol {
    
}
