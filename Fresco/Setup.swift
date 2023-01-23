import AppKit
import ArgumentParser
import Foundation

/// The command to set the icon.
public struct Setup: ParsableCommand {
  public enum Error: LocalizedError {
    /// Invalid resource URL or the resource loaded at this URL.
    case invalidStringResource

    /// The resource at the provided path does not exist or is invalid.
    case invalidPathResource

    /// The application with the provided name is not found.
    case targetApplicationIsNotFound

    /// The target at the provided path does not exist or is not supported.
    case invalidTarget

    /// Insufficient permissions to modify the target.
    case insufficientPermissions

    /// The icon was not set.
    case iconWasNotSet

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
      }
    }
  }

  public static let configuration = CommandConfiguration(
    commandName: "set",
    abstract: "The command to set the icon.",
    usage: """
      fresco set [-a] [-u] <resource> <target>
      fresco BeautifulIcon.icns ../RegularFile.txt
      fresco -au "https://<...>/UnofficialSFSymbolsIcon.icns" "SF Symbols"
    """
  )

  /// Indicates that the target is the application.
  ///
  /// Fresco will try to find an application in the system directory
  /// (`/Applications`) and in the user directory (`~/Applications`, where `~`
  /// is the user's home directory) by the passed name. The application name can
  /// be with or without an extension.
  @Flag(
    name: .customShort("a"),
    help: ArgumentHelp(
      "Indicates that the target is the application.",
      // swiftlint:disable:next line_length
      discussion: "Fresco will try to find an application in the system directory (/Applications) and in the user directory (~/Applications, where ~ is the user’s home directory) by the passed name. The application name can be with or without an extension."
    )
  )
  public var targetApplication = false

  /// Indicates that the resource is the URL.
  ///
  /// Fresco will try to fetch a resource from the remote server. The URL should
  /// end with a file extension.
  @Flag(
    name: .customShort("u"),
    help: ArgumentHelp(
      "Indicates that the resource is the URL.",
      // swiftlint:disable:next line_length
      discussion: "Fresco will try to fetch a resource from the remote server. The URL should end with a file extension."
    )
  )
  public var resourceRemote = false

  /// The path to the resource file.
  ///
  /// The path to the resource file can be either absolute or relative. The
  /// resource file can be in almost any image format, but `.icns` is preferred.
  @Argument(
    help: ArgumentHelp(
      "The path to the resource file.",
      // swiftlint:disable:next line_length
      discussion: "The path to the resource file can be either absolute or relative. The resource file can be in almost any image format, but .icns is preferred."
    )
  )
  public var resource: String

  /// The path to the target file or directory.
  ///
  /// The path to the target can be either absolute or relative. The target can
  /// be a file, directory or application.
  @Argument(
    help: ArgumentHelp(
      "The path to the target file or directory.",
      // swiftlint:disable:next line_length
      discussion: "The path to the target can be either absolute or relative. The target can be a file, directory or application."
    )
  )
  public var target: String

  public init() {}

  private static func setIcon(resource: Resource, target: Target) throws {
    let image = resource.image
    let file = target.url.path()
    guard FileManager.default.isWritableFile(atPath: file) else {
      throw Error.insufficientPermissions
    }
    guard NSWorkspace.shared.setIcon(image, forFile: file) else {
      throw Error.iconWasNotSet
    }
  }

  public func run() throws {
    let resource = try createResource()
    let target = try createTarget()
    try Setup.setIcon(resource: resource, target: target)
  }

  private func createResource() throws -> Resource {
    if resourceRemote {
      guard let resource = Resource(string: resource) else {
        throw Error.invalidStringResource
      }
      return resource
    }
    guard let resource = Resource(path: resource) else {
      throw Error.invalidPathResource
    }
    return resource
  }

  private func createTarget() throws -> Target {
    if targetApplication {
      guard let target = Target(application: target) else {
        throw Error.targetApplicationIsNotFound
      }
      return target
    }
    guard let target = Target(path: target) else {
      throw Error.invalidTarget
    }
    return target
  }
}
