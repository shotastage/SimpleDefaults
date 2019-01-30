//
//  SimpleDefaults.swift
//  SimpleDefaults
//
//  Created by Shota Shimazu on 2019/01/30.
//  Copyright © 2019 Shota Shimazu. All rights reserved.
//

import Foundation


open class UserDefaultStateManager {
    
    /// UserDefaults instance
    private let userDefaults = UserDefaults.standard
    
    
    /// Read recorded user default data
    ///
    /// - Parameter forKey: UserDefaults Key
    /// - Returns: UserDefaults stored data
    public func read(forKey: String) -> Any? {
        
        let prefix = String(describing: self)
        
        let data = userDefaults.object(forKey: "\(prefix)_\(forKey)") ?? nil
        
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
    public func record(_ data: Any?, intoKey: String) {
        
        let prefix = String(describing: self)
        
        userDefaults.set(data, forKey: "\(prefix)_\(intoKey)")
        userDefaults.synchronize()
    }
}
