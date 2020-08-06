//
//  MainVM.swift
//  MVVM-003
//
//  Created by omrobbie on 06/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class MainVM {

    var data = Observable<[NicePlace]>()

    var count: Int {
        return data.property?.count ?? 0
    }

    func getTitle(_ indexPath: IndexPath) -> String? {
        return data.property?[indexPath.row].title
    }

    func getImage(_ indexPath: IndexPath) -> String? {
        return data.property?[indexPath.row].imageUrl
    }

    func fetchData() {
        data.property = [
            NicePlace(title: "Test 1", imageUrl: "photo"),
            NicePlace(title: "Test 2", imageUrl: "person")
        ]
    }
}
