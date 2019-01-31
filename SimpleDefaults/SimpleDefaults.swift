//
//  SimpleDefaults.swift
//  SimpleDefaults
//
//  Created by Shota Shimazu on 2019/01/30.
//  Copyright © 2019 Shota Shimazu. All rights reserved.
//

import Foundation


open class SimpleDefaults {
    
    private var properties: [String] {
        return Mirror(reflecting: self).children.compactMap{ $0.label }
    }
    
    private func attachObserver() {
        properties.forEach { property in
            // TODO: Attach property observer
        }
    }
}
