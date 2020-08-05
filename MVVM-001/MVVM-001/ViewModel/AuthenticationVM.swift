//
//  AuthenticationVM.swift
//  MVVM-001
//
//  Created by omrobbie on 05/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class AuthenticationVM: NSObject {

    var user: User!

    var username: String {return user.username}
    var email: String {return user.email}

    typealias authenticationLoginCallback = (_ status: Bool, _ message: String) -> Void
    var loginCallback: authenticationLoginCallback?

    func authenticationUserWith(_ username: String, andPassword password: String) {
        if username.count != 0 {
            if password.count != 0 {
                verifyUserWith(username, andPassword: password)
            } else {
                // empty password
                loginCallback?(false, "Password should not be empty!")
            }
        } else {
            // empty username
            loginCallback?(false, "User should not be empty!")
        }
    }

    func loginCompletionHandler(callback: @escaping authenticationLoginCallback) {
        loginCallback = callback
    }

    fileprivate func verifyUserWith(_ username: String, andPassword password: String) {
        if username == "test" && password == "1234" {
            user = User(username: username, email: "\(username)@test.com")
            loginCallback?(true, "User is successfully authenticated!")
        } else {
            // invalid credentials
            loginCallback?(false, "Please enter the valid credentials!")
        }
    }
}
