import XCTest

extension XCTestCase {
  var makefile: String {
    root.appending2(path: "Makefile").path2()
  }

  func make(_ subcommand: String) throws -> String {
    try shell("make -f \(makefile) \(subcommand)")
  }
}
