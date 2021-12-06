//
//  CellViewHeaderType.swift
//  FirstStep
//
//  Created by Rotach Roman on 05.12.2021.
//

import UIKit

class CellViewHeaderType: CellViewType {
    
    lazy var header: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.38])
        return label
    }()
    
    init(header: String){
        super.init()
        self.header.text = header
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        super.addSubviews()
        addSubview(header)
    }
    
    override func addConstraints() {
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.topAnchor),
            header.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            header.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            header.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        super.addConstraints()
    }
}
