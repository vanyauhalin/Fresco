@testable import FrescoCore
import XCTest

class ResourceTests: XCTestCase {
  func test_resourceInitializationFromTheRelativePathToTheExistingValidFile() {
    let path = "Fixtures/RegularIcon.icns"
    let resource = Resource(path: path)
    XCTAssertNotNil(resource)
  }

  // swiftlint:disable:next line_length
  func test_resourceInitializationFromTheRelativePathToTheExistingInvalidFile() {
    let path = "Fixtures/BrokenIcon.icns"
    let resource = Resource(path: path)
    XCTAssertNil(resource)
  }

  func test_resourceInitializationFromTheRelativePathToTheNonExistingFile() {
    let path = "Fixtures/RegularIcon2.icns"
    let resource = Resource(path: path)
    XCTAssertNil(resource)
  }

  func test_resourceInitializationFromTheAbsolutePathToTheExistingValidFile() {
    let path = root.appending2(path: "Fixtures/RegularIcon.icns").path2()
    let resource = Resource(path: path)
    XCTAssertNotNil(resource)
  }

  // swiftlint:disable:next line_length
  func test_resourceInitializationFromTheAbsolutePathToTheExistingInvalidFile() {
    let path = root.appending2(path: "Fixtures/BrokenIcon.icns").path2()
    let resource = Resource(path: path)
    XCTAssertNil(resource)
  }

  func test_resourceInitializationFromTheAbsolutePathToTheNonExistingFile() {
    let path = root.appending2(path: "Fixtures/RegularIcon2.icns").path2()
    let resource = Resource(path: path)
    XCTAssertNil(resource)
  }

  func test_resourceInitializationFromTheValidURLToExistingFile() {
    let string = "https://github.com/vanyauhalin/Fresco/blob/main/Fixtures/RegularIcon.icns?raw=true"
    let resource = Resource(string: string)
    XCTAssertNotNil(resource)
  }

  func test_resourceInitializationFromTheValidURLToInvalidExistingFile() {
    let string = "https://github.com/vanyauhalin/Fresco/tree/main/Fixtures/BrokenIcon.icns?raw=true"
    let resource = Resource(string: string)
    XCTAssertNil(resource)
  }

  func test_resourceInitializationFromTheValidURLToNonExistingFile() {
    let string = "https://github.com/vanyauhalin/Fresco/tree/main/Fixtures/RegularIcon2.icns?raw=true"
    let resource = Resource(string: string)
    XCTAssertNil(resource)
  }

  func test_resourceInitializationFromTheInvalidURL() {
    let string = ""
    let resource = Resource(string: string)
    XCTAssertNil(resource)
  }
}
