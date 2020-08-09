//
//  ViewModel.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import RxSwift

protocol ViewModel {

    func getTitleList()
}

class ViewModelImpl: ViewModel {

    private var useCase: UseCase
    private var disposeBag = DisposeBag()

    init(useCase: UseCase) {
        self.useCase = useCase
    }

    func getTitleList() {
        useCase.fetchData()
            .subscribe(onNext: { (data) in
                print(data)
            })
            .disposed(by: disposeBag)
    }
}
