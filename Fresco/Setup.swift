import AppKit
import ArgumentParser
import Foundation

/// The command to set the icon.
public struct Setup: ParsableCommand {
  public enum Error: LocalizedError {
    /// Insufficient permissions to modify the target.
    case insufficientPermissions

    /// The icon was not set.
    case iconWasNotSet

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
    let resource = try Factory.create(from: resource)
    let target = try Factory.create(from: target)
    try Setup.setIcon(resource: resource, target: target)
  }
}
