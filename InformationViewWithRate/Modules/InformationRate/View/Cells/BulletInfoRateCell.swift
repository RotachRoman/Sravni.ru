//
//  BulletInformationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 28.11.2021.
//

import UIKit

//MARK: - Ячейка для списка с буллитами
class BulletInfoRateCell: CellViewType {
    
    //    MARK: - UI elements
    private lazy var bulletTextLabel: UILabel = {
        let label = UILabel( )
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bulletImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        image.image = UIImage(named: "Dot")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - Setup Data -
    private func setupData(bulletTextLabel bulletText: String){
        self.bulletTextLabel.text = bulletText
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        contentView.addSubview(bulletImage)
        contentView.addSubview(bulletTextLabel)
    }
   
    override func addConstraints() {
        super.addConstraints()
        let constant: CGFloat = 16
        NSLayoutConstraint.activate([
            bulletImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: constant),
            bulletImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            bulletImage.heightAnchor.constraint(equalToConstant: 4),
            bulletImage.widthAnchor.constraint(equalToConstant: 4),
            
            bulletTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            bulletTextLabel.leadingAnchor.constraint(equalTo: bulletImage.trailingAnchor, constant: constant),
            bulletTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bulletTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -constant)
        ])
    }
}
//MARK: - Updatable
extension BulletInfoRateCell: Updatable {
    typealias ViewData = BulletViewData
    
    func updateWithViewData(_ viewData: ViewData) {
        self.setupData(bulletTextLabel: viewData.text)
    }
}

