//
//  UseCase.swift
//  MVVM-004
//
//  Created by omrobbie on 07/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

protocol UseCase {

    func fetchData() -> Observable<[ModelEntry]>
}

class UseCaseImpl: UseCase {

    private var repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    func fetchData() -> Observable<[ModelEntry]> {
        repository.fetchData()
    }
}
