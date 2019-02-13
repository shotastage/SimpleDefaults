//
//  SimpleDefaultsIO.swift
//  SimpleDefaults
//
//  Created by Shota Shimazu on 2019/01/30.
//  Copyright © 2019 Shota Shimazu. All rights reserved.
//

import Foundation

/// SimpleDefaults Input / Output or Write / Read
open class SimpleDefaultsIO {
    
    /// UserDefaults instance
    static let userDefaults = UserDefaults.standard
    
    /// Read recorded user default data
    ///
    /// - Parameter forKey: UserDefaults Key
    /// - Returns: UserDefaults stored data
    public static func read(forKey: String) -> Any? {
        
        let prefix = String(describing: self)
        
        let data = userDefaults.object(forKey: "\(prefix)-\(forKey)") ?? nil
        
        guard data != nil else {
            return nil
        }
        
        return data
    }
    
    /// Store data to UserDefaults with key name
    ///
    /// - Parameters:
    ///   - data: Store target data
    ///   - intoKey: UserDefaults stored key
    public static func record(_ data: Any?, intoKey: String) {
        
        let prefix = String(describing: self)
        
        userDefaults.set(data, forKey: "\(prefix)-\(intoKey)")
        userDefaults.synchronize()
    }
    
    /// Store data to UserDefaults with key name prefix
    ///
    /// - Parameters:
    ///   - data: Store target data
    ///   - prefix: Key name prefix
    public static func createAndUpdate(_ data: Any?, prefix: String) {
        
        userDefaults.set(data, forKey: "\(prefix)")
        userDefaults.synchronize()
    }
    
    /// Check key existance
    ///
    /// - Parameters:
    ///   - key: Target key name
    public static func has(key: String) -> Bool {
       return userDefaults.object(forKey: key) != nil
    }
    
    /// Remove objects
    public static func remove(key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
