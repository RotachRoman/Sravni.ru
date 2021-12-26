//
//  CellViewHeaderType.swift
//  InformationViewWithRate
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
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func addSubviews() {
        super.addSubviews()
        contentView.addSubview(header)
    }
    
    override func addConstraints() {
        let constant: CGFloat = 16
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constant),
            header.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            header.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -constant)
        ])
        
        let topContraint = header.topAnchor.constraint(equalTo: contentView.topAnchor)
        topContraint.priority = UILayoutPriority(1)
        topContraint.isActive = true
        
        super.addConstraints()
    }
    
    func updateWithViewData(header: String) {
        self.header.text = header
    }
}
