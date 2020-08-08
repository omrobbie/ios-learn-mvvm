//
//  Model.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

struct Model: Decodable {

    let feed: ModelFeed
}

struct ModelFeed: Decodable {

    let entry: [ModelEntry]
}

struct ModelEntry: Decodable {

    let title: ModelTitle
}

struct ModelTitle: Decodable {

    let label: String
}
