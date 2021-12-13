//
//  AppDelegate.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 06.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appRouter: AppRouterType?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            let _: SetupAppRouterType = SetupAppRouter(window: window)
        }
        return true
    }
}
