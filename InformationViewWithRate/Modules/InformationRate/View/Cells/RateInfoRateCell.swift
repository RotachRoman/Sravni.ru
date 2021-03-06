//
//  RateInforamationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 05.12.2021.
//

import Foundation
import UIKit

//MARK: Ячейка отображения коэффициента
class RateInfoRateCell: CellViewType {
    
    //    MARK: - UI elements
    private lazy var nameRate: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.41])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0.686, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .right
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.24])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - init -
    private func setupData(nameRate: String, rate: String){
        self.nameRate.text = nameRate
        self.rateLabel.text = rate
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        contentView.addSubview(nameRate)
        contentView.addSubview(rateLabel)
    }
    
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            nameRate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
            nameRate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            nameRate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            nameRate.trailingAnchor.constraint(equalTo: rateLabel.leadingAnchor, constant: -12),
            
            rateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 29),
            rateLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            rateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32)
        ])
    }
}
//MARK: - Updatable
extension RateInfoRateCell: Updatable {
    typealias ViewData = RateInfoViewData
    
    func updateWithViewData(_ viewData: ViewData) {
        setupData(nameRate: viewData.title, rate: viewData.rate)
    }
}
