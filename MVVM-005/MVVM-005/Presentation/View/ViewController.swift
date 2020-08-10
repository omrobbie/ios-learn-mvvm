//
//  ViewController.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getTitleList()
    }
}
