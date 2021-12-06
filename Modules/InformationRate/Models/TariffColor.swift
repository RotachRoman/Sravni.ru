//
//  typeBezier.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 02.12.2021.
//

import Foundation
import UIKit

@available(iOS 10.0, *)
enum TariffColor {
    case cheaper
    case expensively
    
    var colors: TariffColors {
        switch self {
        case .cheaper: return
            TariffColors(backgound: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                        sale: UIColor(red: 0.051, green: 0.82, blue: 0.286, alpha: 1))
            
        case .expensively: return
            TariffColors(backgound: UIColor(red: 0.984, green: 0.945, blue: 0.945, alpha: 1),
                        sale: UIColor(red: 0.757, green: 0.114, blue: 0.114, alpha: 1))
        }
    }
}

struct TariffColors {
    var backgound: UIColor
    var sale: UIColor
}
