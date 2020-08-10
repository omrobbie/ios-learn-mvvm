//
//  DependencyInjection.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class DependencyInjection {

    static let container = Container { container in
        container.register(RestApi.self) { (resolver) in
            RestApiImpl()
        }

        container.register(Repository.self) { (resolver) in
            let restApi = resolver.resolve(RestApi.self)!
            return RepositoryImpl(restApi: restApi)
        }

        container.register(UseCase.self) { (resolver) in
            let repository = resolver.resolve(Repository.self)!
            return UseCaseImpl(repository: repository)
        }

        container.register(ViewModel.self) { (resolver) in
            let useCase = resolver.resolve(UseCase.self)!
            return ViewModelImpl(useCase: useCase)
        }
    }

    static func rootViewController() -> UIViewController {
        let container = DependencyInjection.container
        container.storyboardInitCompleted(ViewController.self) { (resolver, c) in
            c.viewModel = resolver.resolve(ViewModel.self)
        }
        let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)

        return storyboard.instantiateInitialViewController()!
    }
}
