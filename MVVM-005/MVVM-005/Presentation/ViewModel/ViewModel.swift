//
//  ViewModel.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ViewModel {

    var data: PublishRelay<[ModelEntry]> {get}

    func getTitleList()
}

class ViewModelImpl: ViewModel {

    var data: PublishRelay<[ModelEntry]> = PublishRelay<[ModelEntry]>()

    private var useCase: UseCase
    private var disposeBag = DisposeBag()

    init(useCase: UseCase) {
        self.useCase = useCase
    }

    func getTitleList() {
        useCase.fetchData()
            .subscribe(onNext: { (data) in
                self.data.accept(data)
            })
            .disposed(by: disposeBag)
    }
}
