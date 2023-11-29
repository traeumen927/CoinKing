//
//  SceneDelegate.swift
//  CoinKing
//
//  Created by 홍정연 on 11/29/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .white
        let nc = UINavigationController(rootViewController: MarketViewController())
        window.rootViewController = nc
        self.window = window
        window.makeKeyAndVisible()
    }
}

