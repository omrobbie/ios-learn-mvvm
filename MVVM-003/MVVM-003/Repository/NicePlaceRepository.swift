//
//  NicePlaceRepository.swift
//  MVVM-003
//
//  Created by omrobbie on 06/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class NicePlaceRepository {

    static let shared = NicePlaceRepository()

    private var nicePlaces = Observable<[NicePlace]>()

    func fetchData() -> Observable<[NicePlace]> {
        nicePlaces.property = [
            NicePlace(title: "Test 1", imageUrl: "photo"),
            NicePlace(title: "Test 2", imageUrl: "person")
        ]

        return nicePlaces
    }

    func addNewValue(nicePlace: NicePlace, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.nicePlaces.property?.append(nicePlace)
            completion()
        }
    }
}
