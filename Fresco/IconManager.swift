import AppKit

/// List of methods for manipulating with target icon.
public enum IconManager {
  public enum Error: LocalizedError {
    /// Insufficient permissions to modify the target.
    case insufficientPermissions

    /// The icon was not set.
    case iconWasNotSet

    /// The icon was not reset.
    case iconWasNotReset

    public var errorDescription: String? {
      switch self {
        case .insufficientPermissions:
          return NSLocalizedString(
            "Insufficient permissions to modify the target.",
            comment: "Insufficient Permissions"
          )
        case .iconWasNotSet:
          return NSLocalizedString(
            "The icon was not set.",
            comment: "Icon Was Not Set"
          )
        case .iconWasNotReset:
          return NSLocalizedString(
            "The icon was not reset.",
            comment: "Icon Was Not Reset"
          )
      }
    }
  }

  public static func set(_ resource: Resource, for target: Target) throws {
    let image = resource.image
    let file = target.url.path2()
    guard FileManager.default.isWritableFile(atPath: file) else {
      throw Error.insufficientPermissions
    }
    guard NSWorkspace.shared.setIcon(image, forFile: file) else {
      throw Error.iconWasNotSet
    }
  }

  public static func reset(for target: Target) throws {
    let file = target.url.path2()
    guard FileManager.default.isWritableFile(atPath: file) else {
      throw Error.insufficientPermissions
    }
    guard NSWorkspace.shared.setIcon(nil, forFile: file) else {
      throw Error.iconWasNotReset
    }
  }
}
