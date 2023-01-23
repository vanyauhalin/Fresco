import Foundation

/// List of methods for creating instances from their options.
public enum Factory {
  public enum Error: LocalizedError {
    /// Invalid resource URL or the resource loaded at this URL.
    case invalidStringResource

    /// The resource at the provided path does not exist or is invalid.
    case invalidPathResource

    /// The application with the provided name is not found.
    case targetApplicationIsNotFound

    /// The target at the provided path does not exist or is not supported.
    case invalidTarget

    public var errorDescription: String? {
      switch self {
        case .invalidStringResource:
          return NSLocalizedString(
            "Invalid resource URL or the resource loaded at this URL.",
            comment: "Invalid String Resource"
          )
        case .invalidPathResource:
          return NSLocalizedString(
            "The resource at the provided path does not exist or is invalid.",
            comment: "Invalid Path Resource"
          )
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

  /// Creates a `Resource` from their options.
  public static func create(from options: ResourceOptions) throws -> Resource {
    if options.remote {
      guard let resource = Resource(string: options.value) else {
        throw Error.invalidStringResource
      }
      return resource
    }
    guard let resource = Resource(path: options.value) else {
      throw Error.invalidPathResource
    }
    return resource

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
