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

  @OptionGroup
  public var target: TargetOptions

  @OptionGroup
  public var resource: ResourceOptions

  public init() {}

  private static func setIcon(resource: Resource, target: Target) throws {
    let image = resource.image
    let file = target.url.path2()
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
    if resource.remote {
      guard let resource = Resource(string: resource.value) else {
        throw Error.invalidStringResource
      }
      return resource
    }
    guard let resource = Resource(path: resource.value) else {
      throw Error.invalidPathResource
    }
    return resource
  }

  private func createTarget() throws -> Target {
    if target.application {
      guard let target = Target(application: target.value) else {
        throw Error.targetApplicationIsNotFound
      }
      return target
    }
    guard let target = Target(path: target.value) else {
      throw Error.invalidTarget
    }
    return target
  }
}
