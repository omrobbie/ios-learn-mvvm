//
//  AuthenticationVM.swift
//  MVVM-001
//
//  Created by omrobbie on 05/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class AuthenticationVM: NSObject {

    func authenticationUserWith(_ username: String, andPassword password: String) {
        if username.count != 0 {
            if password.count != 0 {
                verifyUserWith(username, andPassword: password)
            } else {
                // empty password
            }
        } else {
            // empty username
        }
    }

    fileprivate func verifyUserWith(_ username: String, andPassword password: String) {
        if username == "test" && password == "1234" {
            let user = User(username: username, email: "\(username)@test.com")
        } else {
            // invalid credentials
        }
    }
}
