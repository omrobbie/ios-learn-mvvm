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

    private var data = [ModelEntry]()
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getTitleList()
        setupObserver()
    }

    private func setupObserver() {
        viewModel.data.subscribe(onNext: { (data) in
            self.data = data
            self.tableView.reloadData()
        })
        .disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = data[indexPath.row]
        cell.textLabel?.text = item.title.label
        return cell
    }
}
