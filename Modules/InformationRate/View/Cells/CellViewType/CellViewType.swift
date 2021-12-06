//
//  CellViewType.swift
//  FirstStep
//
//  Created by Rotach Roman on 05.12.2021.
//

import UIKit


class CellViewType: UIView {
    
    init(){
        super.init(frame: .zero)
        addSubviews()
        addConstraints()
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        addConstraints()
    }
    
    override func updateConstraints(){
        addConstraints()
        super.updateConstraints()
    }
    
    
    func addSubviews() {}

    func addConstraints() {}
}
