import AppKit
import ArgumentParser
import Foundation

/// The command to set the icon.
public struct Setup: ParsableCommand {
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

  public func run() throws {
    let resource = try Factory.create(from: resource)
    let target = try Factory.create(from: target)
    try IconManager.set(resource, for: target)
  }
}
