//
//  Observable.swift
//  MVVM-003
//
//  Created by omrobbie on 06/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class Observable<T: Equatable> {

    private let thread: DispatchQueue

    var property: T? {
        willSet {
            if let newValue = newValue, property != newValue {
                thread.async {
                    self.observe?(newValue)
                }
            }
        }
    }

    var observe: ((T) -> ())?

    init(_ value: T? = nil, thread dispatcherThread: DispatchQueue = DispatchQueue.main) {
        thread = dispatcherThread
        property = value
    }
}
