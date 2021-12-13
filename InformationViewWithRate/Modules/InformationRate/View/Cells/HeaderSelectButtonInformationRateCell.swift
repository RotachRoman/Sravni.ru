//
//  HeaderSelectButtonInformationRateCell.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 12.12.2021.
//

import Foundation
import UIKit

//MARK: - Заголовок ячеек/ячейки выбора коэффициента
@available(iOS 12.0, *)
class HeaderSelectButtonInformationRateCell: CellViewHeaderType {
    
    //    MARK: - init -
    override init(header: String){
        let fullHeader = "Узнайте свой " + header.lowercased()
        super.init(header: fullHeader)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View -
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24)
        ])
    }
}
