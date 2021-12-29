//
//  HeaderSelectButtonInformationRateCell.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 12.12.2021.
//

import Foundation
import UIKit

//MARK: - Заголовок ячеек/ячейки выбора коэффициента
class HeaderSlctButtonInfoRateCell: CellViewHeaderType {
    
    //MARK: - Setup View -
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14)
        ])
    }
}
//MARK: - Updatable
extension HeaderSlctButtonInfoRateCell: Updatable {
    typealias ViewData = ButtonHeaderViewData
    
    func updateWithViewData(_ viewData: ViewData) {
        super.updateWithViewData(header: viewData.title)
    }
}
