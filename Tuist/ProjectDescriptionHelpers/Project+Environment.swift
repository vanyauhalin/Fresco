import Foundation
import ProjectDescription

extension Environment {
  private static var current: String {
    ProcessInfo.processInfo.environment["TUIST_ENVIRONMENT"] ?? ""
  }

  public static var production: Bool {
    current == "production"
  }

  // swiftlint:disable:next identifier_name
  public static var ci: Bool {
    current == "ci"
  }
}
