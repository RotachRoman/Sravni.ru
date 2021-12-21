//
//  HeaderInformationRateView.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 04.12.2021.
//

import UIKit


//  MARK: - header с картинкой и title
@available(iOS 12.0, *)
class HeaderInformationRateView: CellViewType {
    
    //    MARK: - UI elements
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.heightAnchor.constraint(equalToConstant: 325).isActive = true
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var header: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.02
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.36, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//   MARK: - OpenSans-Regular ??
    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.388, green: 0.435, blue: 0.49, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - init -
    init(header: String, title: String, imageName: String){
        super.init()
        image.image = UIImage(named: imageName)
        self.header.text = header
        self.title.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        [image, header, title].forEach { contentView.addSubview($0) }
    }
    
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
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
