import XCTest

extension XCTestCase {
  override open func setUp() {
    super.setUp()
    let path = root.path()
    guard FileManager.default.changeCurrentDirectoryPath(path) else {
      fatalError("Failed to replace the current directory.")
    }
  }
}
