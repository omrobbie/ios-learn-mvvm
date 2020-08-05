//
//  ViewController.swift
//  MVVM-001
//
//  Created by omrobbie on 05/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblInformation: UILabel!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    var authenticationVM = AuthenticationVM()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnLoginTapped(_ sender: Any) {
        guard let username = txtUsername.text,
            let password = txtPassword.text
            else {return}

        lblInformation.text = "Information"
        authenticationVM.authenticationUserWith(username, andPassword: password)
        authenticationVM.loginCompletionHandler { (status, message) in
            if status {
                self.lblInformation.text = "Logged in with username = \(self.authenticationVM.username) and email = \(self.authenticationVM.email)"
            } else {
                self.lblInformation.text = message
            }
        }
    }
}
