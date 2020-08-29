//
//  ViewController.swift
//  MVVM-006
//
//  Created by omrobbie on 29/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    static func instantiate() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        return viewController
    }

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    private func loadData() {
        let service = RestaurantService()
        service.fetchRestaurants().subscribe(onNext: { (restaurants) in
            print(restaurants)
        }).disposed(by: disposeBag)
    }
}
