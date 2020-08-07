//
//  Model.swift
//  MVVM-004
//
//  Created by omrobbie on 07/08/20.
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
