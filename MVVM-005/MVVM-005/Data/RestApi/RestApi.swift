//
//  RestApi.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Alamofire
import RxAlamofire
import RxSwift

protocol RestApi {

    func fetchData() -> Observable<[ModelEntry]>
}

class RestApiImpl: RestApi {

    private let BASE_URL = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"

    func fetchData() -> Observable<[ModelEntry]> {
        requestData(.get, BASE_URL)
            .flatMap { (data) -> Observable<[ModelEntry]> in
                let decodeData = try JSONDecoder().decode(Model.self, from: data.1)
                print(decodeData)
                return Observable.just(decodeData.feed.entry)
        }
    }
}
