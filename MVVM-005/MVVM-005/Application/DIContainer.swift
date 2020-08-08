//
//  DIContainer.swift
//  MVVM-005
//
//  Created by omrobbie on 08/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Swinject

extension Assembler {

    static let shared: Assembler = {
        let container = Container()
        let assembler = Assembler([DependencyInjection()], container: container)
        return assembler
    }()
}
