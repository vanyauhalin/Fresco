@testable import FrescoFramework
import XCTest

class VersionTests: XCTestCase {
  func test_versionCurrent() {
    XCTAssertEqual(Version.current, "0.1.0")
  }
}
