//
//  RestaurantViewModel.swift
//  MVVM-006
//
//  Created by omrobbie on 29/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

struct RestaurantViewModel {
    private let restaurant: Restaurant

    var displayText: String {
        return restaurant.name + " = " + restaurant.cuisine.rawValue.capitalized
    }

    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
