import Foundation

public enum ResourceFactory {
  public enum Error: LocalizedError {
    /// Invalid resource URL or the resource loaded at this URL.
    case invalidStringResource

    /// The resource at the provided path does not exist or is invalid.
    case invalidPathResource

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
}
