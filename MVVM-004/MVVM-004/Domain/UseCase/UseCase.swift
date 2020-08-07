//
//  UseCase.swift
//  MVVM-004
//
//  Created by omrobbie on 07/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

protocol UseCase {

    func fetchData()
}

class UseCaseImpl: UseCase {

    func fetchData() {
        // TODO: Get data from API
    }
}
