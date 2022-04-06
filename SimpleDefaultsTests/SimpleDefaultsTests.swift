//
//  SimpleDefaultsTests.swift
//  SimpleDefaultsTests
//
//  Created by Shota Shimazu on 2019/01/30.
//  Copyright © 2019 Shota Shimazu. All rights reserved.
//

import XCTest
@testable import SimpleDefaults


class SimpleDefaultsTests: XCTestCase {

    let bundle = Bundle.main.bundleIdentifier


    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataChange() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let modelClass = TestModelClass()

        modelClass.name = "Riko Takebayashi"
        modelClass.gender = 1
        modelClass.age = 20

        XCTAssert(modelClass.name == "Riko Takebayashi", "Failed to store name!")
        XCTAssert(modelClass.gender == 1, "Failed to store gender!")
        XCTAssert(modelClass.age == 20, "Failed to store age!")

        modelClass.name = "Shota Shimazu"
    }

    func testDataPersistence() {
        let modelClass = TestModelClass()

        XCTAssert(modelClass.name == "Shota Shimazu", "Failed to store name!")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
