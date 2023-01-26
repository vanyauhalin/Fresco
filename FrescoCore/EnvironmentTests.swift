@testable import FrescoCore
import XCTest

class EnvironmentTests: XCTestCase {
  func test_frescoVersion() throws {
    let version = try make("version").trimmingCharacters(in: .newlines)
    XCTAssertEqual(Environment.version, version)
  }
}
