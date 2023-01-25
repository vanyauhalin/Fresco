import Foundation

public enum TargetFactory {
  public enum Error: LocalizedError {
    /// The application with the provided name is not found.
    case targetApplicationIsNotFound

    /// The target at the provided path does not exist or is not supported.
    case invalidTarget

    public var errorDescription: String? {
      switch self {
        case .targetApplicationIsNotFound:
          return NSLocalizedString(
            "The application with the provided name is not found.",
            comment: "Target Application Is Not Found"
          )
        case .invalidTarget:
          return NSLocalizedString(
            // swiftlint:disable:next line_length
            "The target at the provided path does not exist or is not supported.",
            comment: "Invalid Target"
          )
      }
    }
  }

  /// Creates a `Target` from their options.
  public static func create(from options: TargetOptions) throws -> Target {
    if options.application {
      guard let target = Target(application: options.value) else {
        throw Error.targetApplicationIsNotFound
      }
      return target
    }
    guard let target = Target(path: options.value) else {
      throw Error.invalidTarget
    }
    return target
  }
}
