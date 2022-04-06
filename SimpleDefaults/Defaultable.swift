//
//  File.swift
//  
//
//  Created by Shota Shimazu on 2022/04/06.
//

import Foundation

public struct Defaultable {
    private var properties: [String] {
        return Mirror(reflecting: self).children.compactMap{ $0.label }
    }
}
