//
//  MainVM.swift
//  MVVM-003
//
//  Created by omrobbie on 06/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class MainVM {

    private var repo = NicePlaceRepository.shared

    var data = Observable<[NicePlace]>()
    var isLoading = Observable<Bool>(false)

    var count: Int {
        return data.property?.count ?? 0
    }

    init() {
        data = repo.fetchData()
    }

    func getTitle(_ indexPath: IndexPath) -> String? {
        return data.property?[indexPath.row].title
    }

    func getImage(_ indexPath: IndexPath) -> String? {
        return data.property?[indexPath.row].imageUrl
    }

    func addNewValue(nicePlace: NicePlace) {
        isLoading.property = true
        repo.addNewValue(nicePlace: nicePlace) {
            self.isLoading.property = false
        }
    }
}
