//
//  SceneDelegate.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 27/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = MainViewController()
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }
}

