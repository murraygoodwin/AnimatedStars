import XCTest
@testable import AnimatedStars

final class AnimatedStarsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AnimatedStars().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
