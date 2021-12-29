//
//  StaticTextInformationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 05.12.2021.
//

import Foundation

import UIKit

//MARK: - Ячейка статичного текста
class StaticTextInfoRateCell: CellViewHeaderType {
    
    //    MARK: - UI elements
    private lazy var text: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        var attributedString: [NSAttributedString.Key: Any] = [NSAttributedString.Key.kern: -0.24]
        label.attributedText = NSMutableAttributedString(string: "", attributes: attributedString)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    //MARK: - Setup Data -
    private func setupData(text: String) {
        let regularAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular)]
        let boldAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold)]
        let changedText = text.changeStyle(startTeg: "&*", endTeg: "*&", normalAttribute: regularAttribute, tegAttribute: boldAttribute)
        self.text.attributedText = changedText
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        contentView.addSubview(text)
    }
    
    override func addConstraints(){
        let constant: CGFloat = 16
        super.addConstraints()
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: constant)
        ])
        
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: header.bottomAnchor, constant: constant),
            text.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constant),
            text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -constant)
        ])
    }
}
//MARK: - Updatable
extension StaticTextInfoRateCell: Updatable {
    typealias ViewData = StaticTextViewData
    
    func updateWithViewData(_ viewData: ViewData) {
        super.updateWithViewData(header: viewData.header)
        setupData(text: viewData.text)
        addConstraints()
        addSubviews()
    }
}
