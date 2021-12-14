//
//  ChooseRateRouter.swift
//  FirstStep
//
//  Created by Rotach Roman on 12.12.2021.
//

import Foundation

@available(iOS 12.0, *)
class ChooseRateRouter {
    private let nameRate: String
    private let backRouter: IRTRouterStartWithSelectedRateProtocol
    
    init(nameRate: String, backRouter: IRTRouterStartWithSelectedRateProtocol){
        self.nameRate = nameRate
        self.backRouter = backRouter
        returnNameAndURL()
    }
    
    private func returnNameAndURL(){
        self.backRouter.addSelectedRate(title: nameRate, urlString: "GetRate")
    }
}
