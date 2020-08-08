//
//  Model.swift
//  MVVM-004
//
//  Created by omrobbie on 07/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

struct Model: Decodable, Equatable {

    let feed: ModelFeed
}

struct ModelFeed: Decodable, Equatable {

    let entry: [ModelEntry]
}

struct ModelEntry: Decodable, Equatable {

    let title: ModelTitle
}

struct ModelTitle: Decodable, Equatable {

    let label: String
}
