//
//  UseCase.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import RxSwift

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
