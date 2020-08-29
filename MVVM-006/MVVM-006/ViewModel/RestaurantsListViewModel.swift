//
//  RestaurantsListViewModel.swift
//  MVVM-006
//
//  Created by omrobbie on 29/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import RxSwift

final class RestaurantsListViewModel {
    let title = "Restaurants"

    private let restaurantService: RestaurantService

    init(restaurantService: RestaurantService) {
        self.restaurantService = restaurantService
    }
}
