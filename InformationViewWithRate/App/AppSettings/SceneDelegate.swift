//
//  SceneDelegate.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 06.12.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var appRouter: AppRouterType?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let _: SetupAppRouterType = SetupAppRouter(window: window)
    }
}
