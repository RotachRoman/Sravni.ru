//
//  CreateViewFromCellsInformationRateFacade.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 10.12.2021.
//

import UIKit

//MARK: Паттерн для создания ячеек(шаблонный метод)

/// Для того, чтобы данные менялись в ячейке выбора "коэффициента",
/// необходимо инициализировать переменную presenter: СhooseRatePresenterType
@available(iOS 12.0, *)
class CreateInformationRateCellAlgoritm {
    var informationRate: InformationRate!
    internal var presenter: СhangeRatePresenterType
    
    private var cells: [CellViewType] = []
    
    init(presenter: СhangeRatePresenterType){
        self.presenter = presenter
    }
    
    internal func addHeader() -> CellViewType? { return nil }
    internal func addStaticText() -> CellViewType? { return nil }
    internal func addBulletCell() -> [CellViewType] { return [] }
    internal func addTariffCell() -> CellViewType? { return nil }
    internal func addNoteCell() -> CellViewType? { return nil }
    internal func addRateButton() -> [CellViewType] { return [] }
    internal func addRateInformation() -> CellViewType? { return nil }
    internal func addBackButton() -> CellViewType {
        return BackButtonInformationRateView()
    }
    
//    заполняется массив ячеек вью для дальнейшего отображения
    final func addCells(informationRate: InformationRate) -> [CellViewType] {
        self.cells = []
        self.informationRate = informationRate
        
        [addHeader(), addStaticText()].forEach {
            appendCells($0)
        }
        addBulletCell().forEach { cell in
            appendCells(cell)
        }
        [addTariffCell(), addNoteCell()].forEach {
            appendCells($0)
        }
        addRateButton().forEach { cell in
            appendCells(cell)
        }
        [addRateInformation(), addBackButton()].forEach {
            appendCells($0)
        }
        return cells
    }
    
//    чтобы не повторяться в коде, выносим функцию добавления ячеек
    private func appendCells(_ cell: CellViewType?) {
        guard let cell = cell else { return }
        cells.append(cell)
    }
// Хотел сделать [addHeader(), addStaticText(), arrayCells(addBulletCell)].forEach но не дает, ведь массив в массиве. Можно
//    private func arrayCells(_ function: () -> [CellViewType]) -> [CellViewType?] {
//        var cells: [CellViewType?] = []
//        for view in function() {
//            cells.append(view)
//        }
//        return cells
//    }
}
