//
//  IO.swift
//  SimpleDefaults
//
//  Created by Shota Shimazu on 2019/04/08.
//  Copyright © 2019 Shota Shimazu. All rights reserved.
//

import Foundation

/// SimpleDefaults Input / Output or Write / Read
open class DefaultRW {

    /// UserDefaults instance
    static let userDefaults = UserDefaults.standard

    /// Read recorded user default data
    ///
    /// - Parameter forKey: UserDefaults Key
    /// - Returns: UserDefaults stored data
    public static func read(forKey: String) -> Any? {

        let data = userDefaults.object(forKey: "\(forKey)") ?? nil

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

        userDefaults.set(data, forKey: "\(intoKey)")
        userDefaults.synchronize()
    }

    public static func register(_ data: [String: Any]) {
        userDefaults.register(defaults: data)
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
