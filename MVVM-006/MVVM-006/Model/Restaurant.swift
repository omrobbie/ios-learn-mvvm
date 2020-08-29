//
//  Restaurant.swift
//  MVVM-006
//
//  Created by omrobbie on 29/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

enum Cuisine {
    case european
    case indian
    case french
    case english
}

struct Restaurant {
    let name: String
    let cuisine: Cuisine
}
