@testable import FrescoCore
import XCTest

class TargetTests: XCTestCase {
  // swiftlint:disable:next line_length
  func test_targetInitializationFromTheRelativePathToTheExistingSupportedApplication() {
    let path = "Fixtures/RegularApplication.app"
    let target = Target(path: path)
    XCTAssertNotNil(target)
  }

  // swiftlint:disable:next line_length
  func test_targetInitializationFromTheRelativePathToTheExistingSupportedDirectory() {
    let path = "Fixtures/RegularDirectory"
    let target = Target(path: path)
    XCTAssertNotNil(target)
  }

  // swiftlint:disable:next line_length
  func test_targetInitializationFromTheRelativePathToTheExistingSupportedFile() {
    let path = "Fixtures/RegularFile.txt"
    let target = Target(path: path)
    XCTAssertNotNil(target)
  }

  // swiftlint:disable:next line_length
  func test_targetInitializationFromTheRelativePathToTheExistingNonSupportedSymbolicLink() {
    let path = "Fixtures/RegularSymbolicLink"
    let target = Target(path: path)
    XCTAssertNil(target)
  }

  func test_targetInitializationFromTheRelativePathToTheNonExistingFile() {
    let path = "Fixtures/RegularFile2.txt"
    let target = Target(path: path)
    XCTAssertNil(target)
  }

  // swiftlint:disable:next line_length
  func test_targetInitializationFromTheAbsolutePathToTheExistingSupportedApplication() {
    let path = root.appending2(path: "Fixtures/RegularApplication.app").path2()
    let target = Target(path: path)
    XCTAssertNotNil(target)
  }

  // swiftlint:disable:next line_length
  func test_targetInitializationFromTheAbsolutePathToTheExistingSupportedDirectory() {
    let path = root.appending2(path: "Fixtures/RegularDirectory").path2()
    let target = Target(path: path)
    XCTAssertNotNil(target)
  }

  // swiftlint:disable:next line_length
  func test_targetInitializationFromTheAbsolutePathToTheExistingSupportedFile() {
    let path = root.appending2(path: "Fixtures/RegularFile.txt").path2()
    let target = Target(path: path)
    XCTAssertNotNil(target)
  }

  // swiftlint:disable:next line_length
  func test_targetInitializationFromTheAbsolutePathToTheExistingNonSupportedSymbolicLink() {
    let path = root.appending2(path: "Fixtures/RegularSymbolicLink").path2()
    let target = Target(path: path)
    XCTAssertNil(target)
  }

  func test_targetInitializationFromTheAbsolutePathToTheNonExistingFile() {
    let path = root.appending2(path: "Fixtures/RegularFile2.txt").path2()
    let target = Target(path: path)
    XCTAssertNil(target)
  }

  func test_targetInitializationFromTheExistingApplicationNameWithExtension() {
    let application = "Xcode.app"
    let target = Target(application: application)
    XCTAssertNotNil(target)
  }

  // swiftlint:disable:next line_length
  func test_targetInitializationFromTheExistingApplicationNameWithoutExtension() {
    let application = "Xcode"
    let target = Target(application: application)
    XCTAssertNotNil(target)
  }

  func test_targetInitializationFromTheNonExistingApplicationName() {
    let application = "Xcode2.app"
    let target = Target(application: application)
    XCTAssertNil(target)
  }
}
