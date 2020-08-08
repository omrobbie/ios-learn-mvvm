//
//  DependencyInjection.swift
//  MVVM-004
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

protocol DependencyInjection {

    func startViewController() -> UIViewController
}

class DependencyInjectionImpl: DependencyInjection {

    func startViewController() -> UIViewController {
        let restApi = RestApiImpl()
        let repository = RepositoryImpl(restApi: restApi)
        let useCase = UseCaseImpl(repository: repository)
        let viewModel = ViewModelImpl(useCase: useCase)
        let viewController = ViewController.create(viewModel: viewModel)

        return viewController
    }
}
