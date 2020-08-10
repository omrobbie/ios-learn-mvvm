//
//  ViewController.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var viewModel: ViewModel!

    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getTitleList()
        setupObserver()
    }

    private func setupObserver() {
        viewModel.data.bind(to: self.tableView.rx.items(cellIdentifier: "cell")) { (row, item, cell) in
            cell.textLabel?.text = item.title.label
        }.disposed(by: disposeBag)
    }
}
