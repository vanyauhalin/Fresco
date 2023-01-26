import XCTest

extension XCTestCase {
  public var root: URL {
    URL(
      fileURLWithPath: #file.replacingOccurrences(
        of: "/FrescoCore/XCTestCase+root.swift",
        with: ""
      )
    )
  }
}
