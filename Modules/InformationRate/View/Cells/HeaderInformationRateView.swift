//
//  HeaderInformationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 04.12.2021.
//

import UIKit

@available(iOS 10.0, *)
class HeaderInformationRateView: CellViewType {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var header: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.numberOfLines = 0
//        MARK: - Display
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//   MARK: - OpenSans-Regular ??
    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.388, green: 0.435, blue: 0.49, alpha: 1)
        label.font = UIFont(name: "OpenSans-Regular", size: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(header: String, title: String, imageName: String){
        super.init()

        image.image = UIImage(named: imageName)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.02
        self.header.attributedText = NSMutableAttributedString(string: header, attributes: [NSAttributedString.Key.kern: 0.36, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        paragraphStyle.lineHeightMultiple = 1.05

        self.title.attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        super.addSubviews()
        [image, header, title].forEach { addSubview($0) }
    }
    
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 16),
            title.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -16),
            title.trailingAnchor.constraint(lessThanOrEqualTo: image.trailingAnchor, constant: -16),
        ])
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 16),
            header.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -4),
            header.trailingAnchor.constraint(lessThanOrEqualTo: image.trailingAnchor, constant: -16)
        ])
    }
}
