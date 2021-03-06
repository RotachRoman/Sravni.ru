//
//  ViewType.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 11.12.2021.
//

import UIKit

class ViewType: UIView {
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {}

    func addConstraints() {}
}
