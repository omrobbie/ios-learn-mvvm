//
//  Repository.swift
//  MVVM-004
//
//  Created by omrobbie on 07/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

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
        return restApi.observableModel
    }
}
