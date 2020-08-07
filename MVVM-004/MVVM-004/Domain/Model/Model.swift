//
//  Model.swift
//  MVVM-004
//
//  Created by omrobbie on 07/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

struct Model {

    let feed: ModelFeed
}

struct ModelFeed {

    let entry: [ModelEntry]
}

struct ModelEntry {

    let title: ModelTitle
}

struct ModelTitle {

    let label: String
}
