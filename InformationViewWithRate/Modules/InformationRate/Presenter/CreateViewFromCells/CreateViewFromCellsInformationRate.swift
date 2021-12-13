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
    
    final func addCells(informationRate: InformationRate) -> [CellViewType] {
        self.cells = []
        self.informationRate = informationRate
        
        appendCells(addHeader())
        appendCells(addStaticText())
        for bullet in addBulletCell() {
            appendCells(bullet)
        }
        appendCells(addTariffCell())
        appendCells(addNoteCell())
        for button in addRateButton() {
            appendCells(button)
        }
        appendCells(addRateInformation())
        appendCells(addBackButton())
        return cells
    }
    
    private func appendCells(_ cell: CellViewType?) {
        guard let cell = cell else { return }
        cells.append(cell)
    }
}
