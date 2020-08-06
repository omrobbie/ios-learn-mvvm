//
//  ViewController.swift
//  MVVM-003
//
//  Created by omrobbie on 06/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewIndicator: UIActivityIndicatorView!

    let viewModel = MainVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupList()
        observeData()
        observeLoading()
    }

    private func setupList() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func observeData() {
        viewModel.data.observe = { _ in
            self.tableView.reloadData()
        }
    }

    private func observeLoading() {
        viewModel.isLoading.observe = { isLoading in
            if isLoading {
                self.tableViewIndicator.startAnimating()
            } else {
                self.tableViewIndicator.stopAnimating()
            }
        }
    }

    @IBAction func btnAddTapped(_ sender: Any) {
        viewModel.addNewValue(nicePlace: NicePlace(title: "Add New Item", imageUrl: "lightbulb"))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.imageView?.image = UIImage(systemName: viewModel.getImage(indexPath) ?? "")
        cell.textLabel?.text = viewModel.getTitle(indexPath)
        return cell
    }
}
