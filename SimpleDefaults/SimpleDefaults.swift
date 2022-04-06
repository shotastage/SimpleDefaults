//
//  SimpleDefaults.swift
//  SimpleDefaults
//
//  Created by Shota Shimazu on 2019/01/30.
//  Copyright © 2019 Shota Shimazu. All rights reserved.
//

import Foundation

open class SimpleDefaults: NSObject {
    
    override public init() {
        super.init()
        self.registerDefaults()
        self.seedProperties()
        self.attachObserver()
    }
    
    private var properties: [String] {
        return Mirror(reflecting: self).children.compactMap{ $0.label }
    }
    
    deinit {
        properties.forEach { property in
            self.removeObserver(self, forKeyPath: property)
        }
    }
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let propertyName = keyPath else { return }
        
        let key = generateKey(key: propertyName)
        let newValue = change?[.newKey]
        DefaultRW.record(newValue, intoKey: key)
    }
}


extension SimpleDefaults {
    
    // Seed data to class properties when model class is initialized
    fileprivate func seedProperties() {
        properties.forEach { property in
            let key = generateKey(key: property)
            setValue(DefaultRW.read(forKey: key), forKey: property)
        }
    }
    
    // Attach observer when SD model class is initialized
    fileprivate func attachObserver() {
        properties.forEach { property in
            self.addObserver(self, forKeyPath: property, options: [.old, .new], context: nil)
        }
    }
    
    // Register defualt value
    fileprivate func registerDefaults() {
        DefaultRW.register(properties.reduce(into: [String : Any]()) { result, property in
            if let value = value(forKey: property) {
                result[generateKey(key: property)] = value
            }
        })
    }
}


extension SimpleDefaults {
    
    // Generate unique key name with specified given name
    fileprivate func generateKey(key: String) -> String {
        let bundleIdentifier = Bundle.main.bundleIdentifier!
        
        let className = String(describing: type(of: self))
        
        return "\(bundleIdentifier).\(className).\(key)"
    }
}
