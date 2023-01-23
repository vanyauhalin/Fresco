@testable import FrescoFramework
import XCTest

class FrescoTests: XCTestCase {
  func test_frescoVersion() throws {
    let version = try make("version").trimmingCharacters(in: .newlines)
    XCTAssertEqual(Fresco.version, version)
  }
}
