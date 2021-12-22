//
//  CreateViewFromCellsInformationRateFacade.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 10.12.2021.
//

//MARK: Паттерн для создания ячеек(шаблонный метод)

/// Для того, чтобы данные менялись в ячейке выбора "коэффициента",
/// необходимо инициализировать переменную presenter: СhooseRatePresenterType
class CreateInformationRateCellAlgoritm {
    var informationTariff: InformationTariff!
    internal weak var presenter: СhangeRatePresenterType?
    
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
    final func addCells(informationTariff: InformationTariff) -> [CellViewType] {
        self.cells = []
        self.informationTariff = informationTariff
        
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
    
    final func getCell(index: Int) -> CellViewType {
        return cells[index]
    }
    
//    чтобы не повторяться в коде, выносим функцию добавления ячеек
    private func appendCells(_ cell: CellViewType?) {
        guard let cell = cell else { return }
        cells.append(cell)
    }
}
