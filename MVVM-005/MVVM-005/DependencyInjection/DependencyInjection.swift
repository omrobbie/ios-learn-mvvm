//
//  DependencyInjection.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Swinject

class DependencyInjection: Assembly {
    func assemble(container: Container) {
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

        container.register(ViewController.self) { (resolver) in
            let viewModel = resolver.resolve(ViewModel.self)!
            return ViewController(viewModel: viewModel)
        }
    }
}
