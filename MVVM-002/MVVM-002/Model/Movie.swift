//
//  Movie.swift
//  MVVM-002
//
//  Created by omrobbie on 05/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

struct Movie: Decodable {

    let feed: MovieFeed
}

struct MovieFeed: Decodable {

    let entry: [MovieEntry]
}

struct MovieEntry: Decodable {

    let name: MovieEntryName

    enum CodingKeys: String, CodingKey {
        case name = "im:name"
    }
}

struct MovieEntryName: Decodable {

    let label: String
}
