//
//  AppCoordinator.swift
//  MVVM-006
//
//  Created by omrobbie on 29/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let viewController = ViewController()
        viewController.view.backgroundColor = .red // test if this code working
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
