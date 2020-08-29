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
        let service = RestaurantService()
        let viewModel = RestaurantsListViewModel(restaurantService: service)
        let viewController = ViewController.instantiate(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
