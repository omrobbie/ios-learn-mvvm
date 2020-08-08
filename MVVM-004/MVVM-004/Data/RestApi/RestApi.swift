//
//  RestApi.swift
//  MVVM-004
//
//  Created by omrobbie on 07/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

protocol RestApi {

    var observableModel: Observable<[ModelEntry]> {get}

    func fetchData()
}

class RestApiImpl: RestApi {

    var observableModel: Observable<[ModelEntry]> = Observable<[ModelEntry]>()

    private let BASE_URL = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
}

extension RestApiImpl {

    func fetchData() {
        guard let url = URL(string: BASE_URL) else {return}

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error:", error.localizedDescription)
                return
            }

            guard let data = data else {return}
            do {
                let decodeData = try JSONDecoder().decode(Model.self, from: data)
                self.observableModel.property = decodeData.feed.entry
            } catch {
                print("Error", error.localizedDescription)
            }
        }.resume()
    }
}
