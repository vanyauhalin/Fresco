import Foundation
import ProjectDescription

extension Environment {
  // swiftlint:disable:next identifier_name
  public static var ci: Bool {
    Bool(ProcessInfo.processInfo.environment["TUIST_CI"] ?? "") ?? false
  }
}
