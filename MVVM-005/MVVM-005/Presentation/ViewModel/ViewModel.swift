//
//  ViewModel.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import RxSwift

protocol ViewModel {

    func getTitleList() -> Observable<[ModelEntry]>
}

class ViewModelImpl: ViewModel {

    private var useCase: UseCase

    init(useCase: UseCase) {
        self.useCase = useCase
    }

    func getTitleList() -> Observable<[ModelEntry]> {
        useCase.fetchData()
    }
}
