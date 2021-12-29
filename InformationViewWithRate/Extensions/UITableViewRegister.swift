//
//  UITableViewRegister.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 29.12.2021.
//

import UIKit

extension UITableView {
   func registerCell(_ cell: AnyClass) {
       register(cell, forCellReuseIdentifier: String(describing: cell))
   }
}


extension UITableView {
    func addTopBounceAreaView(color: UIColor = .white) {
        var frame = UIScreen.main.bounds
        frame.origin.y = -frame.size.height

        let view = UIView(frame: frame)
        view.backgroundColor = color

        self.addSubview(view)
    }
}
