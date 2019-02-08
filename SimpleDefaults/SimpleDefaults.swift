//
//  SimpleDefaults.swift
//  SimpleDefaults
//
//  Created by Shota Shimazu on 2019/01/30.
//  Copyright © 2019 Shota Shimazu. All rights reserved.
//

import Foundation


open class SimpleDefaults: NSObject {
    
    private var properties: [String] {
        return Mirror(reflecting: self).children.compactMap{ $0.label }
    }
    
    deinit {
        properties.forEach { property in
            self.removeObserver(self, forKeyPath: property)
        }
    }

    private func attachObserver() {
        properties.forEach { property in
            self.addObserver(self, forKeyPath: property, options: [.old, .new], context: nil)
        }
    }
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // TODO: Implement observer
        SimpleDefaultsIO.record(object, intoKey: keyPath!)
    }
}
