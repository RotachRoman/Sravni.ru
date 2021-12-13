//
//  CustomProgressBar.swift
//  FirstStep
//
//  Created by Rotach Roman on 13.12.2021.
//

import UIKit

class CustomProgressBar: UIView {
    
    let shapeLayer = CAShapeLayer()
    
    init(){
        super.init(frame: .zero)
        
        let center = self.center
        let trackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 20, startAngle: CGFloat.pi / 2, endAngle: 2 * -CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 4
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        self.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor(red: 0, green: 0.686, blue: 1, alpha: 1).cgColor
        shapeLayer.lineWidth = 4
        shapeLayer.fillColor = UIColor(red: 0.941, green: 0.98, blue: 1, alpha: 1).cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        
        addSubviews()
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.layer.addSublayer(shapeLayer)
    }
    
    @objc
    private func handleTap() {
        print("Attempting to animate stroke")
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }

}
