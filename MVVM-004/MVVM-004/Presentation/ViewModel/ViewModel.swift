//
//  ViewModel.swift
//  MVVM-004
//
//  Created by omrobbie on 07/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

class ViewModel {

    var model = [ModelEntry]()

    private var useCase: UseCase

    init(useCase: UseCase) {
        self.useCase = useCase
    }

    func getTitleList() {
        useCase.fetchData()
    }
}
