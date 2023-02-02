import XCTest

extension XCTestCase {
  var root: URL {
    URL(
      fileURLWithPath: #file.replacingOccurrences(
        of: "/FrescoCLI/XCTestCase+root.swift",
        with: ""
      )
    )
  }
}
