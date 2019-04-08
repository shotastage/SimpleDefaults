//
//  TestModels.swift
//  SimpleDefaultsTests
//
//  Created by Shota Shimazu on 2019/04/08.
//  Copyright © 2019 Shota Shimazu. All rights reserved.
//

import Foundation
import SimpleDefaults

class TestModelClass: SimpleDefaults {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    @objc dynamic var name: String = "Shota Shimazu"
    @objc dynamic var gender: Int = 0
    @objc dynamic var age: Int = 21
}
