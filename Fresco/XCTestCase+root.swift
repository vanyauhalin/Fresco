import XCTest

extension XCTestCase {
  public var root: URL {
    URL(
      fileURLWithPath: #file.replacingOccurrences(
        of: "/Fresco/XCTestCase+root.swift",
        with: ""
      )
    )
  }
}
