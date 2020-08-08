//
//  Repository.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import RxSwift

protocol Repository {

    func fetchData() -> Observable<[ModelEntry]>
}

class RepositoryImpl: Repository {

    private var restApi: RestApi

    init(restApi: RestApi) {
        self.restApi = restApi
    }

    func fetchData() -> Observable<[ModelEntry]> {
        restApi.fetchData()
    }
}
