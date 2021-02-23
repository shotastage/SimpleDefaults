import XCTest
@testable import SimpleDefaults

final class SimpleDefaultsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SimpleDefaults().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
