//
//  SceneDelegate.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window?.windowScene = windowScene

        let viewController = Assembler.shared.resolver.resolve(ViewController.self)!

        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
