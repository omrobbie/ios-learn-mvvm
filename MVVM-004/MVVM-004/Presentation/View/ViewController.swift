//
//  ViewController.swift
//  MVVM-004
//
//  Created by omrobbie on 07/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel: ViewModelImpl!

    static func create(viewModel: ViewModelImpl) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController

        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getTitleList()
    }
}
