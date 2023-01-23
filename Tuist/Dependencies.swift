import Foundation
import ProjectDescription

extension Environment {
  public static var ci: Bool {
    Bool(ProcessInfo.processInfo.environment["TUIST_CI"] ?? "") ?? false
  }
}

let dependencies = Environment.ci
  ? Dependencies()
  : Dependencies(
    swiftPackageManager: [
      .remote(
        url: "https://github.com/realm/SwiftLint",
        requirement: .branch("main")
      )
    ]
  )
