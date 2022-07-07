//
//  SimpleMigrate.swift
//  SimpleDefaults
//
//  Created by Shota Shimazu on 2019/02/13.
//  Copyright © 2019 Shota Shimazu. All rights reserved.
//

import Foundation

/// SimpleDefaults migrator
open class SimpleMigrate {

    static func removeModelBy(className: String) {

        let modelClassInstance: AnyClass? = NSClassFromString(className)

        var properties: [String] {
            return Mirror(reflecting: modelClassInstance.self!).children.compactMap{ $0.label }
        }
    }

    static func refreshStructureBy(className: String) {

    }
}
