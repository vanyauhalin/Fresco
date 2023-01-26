import FrescoCore
import XCTest

extension XCTestCase {
  public var makefile: String {
    root.appending2(path: "Makefile").path2()
  }

  public func make(_ subcommand: String) throws -> String {
    try shell("make -f \(makefile) \(subcommand)")
  }
}
