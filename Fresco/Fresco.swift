import ArgumentParser
import Foundation

@main
public struct Fresco: ParsableCommand {
  /// The command to set the icon.
  public struct Set: ParsableCommand {
    public static let configuration = CommandConfiguration(
      abstract: "Set the icon for the target.",
      usage: """
      fresco set [-a] [-u] <resource> <target>
      fresco set BeautifulIcon.icns ../RegularFile.txt
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

  /// The command to print the current fresco version.
  public struct Version: ParsableCommand {
    public static let configuration = CommandConfiguration(
      abstract: "Print the current fresco version."
    )

    public init() {}

    public func run() {
      print(Fresco.version)
    }
  }

  /// The current fresco version.
  public static let version = "0.1.1"

  public static let configuration = CommandConfiguration(
    abstract: "The handy icon manager for macOS.",
    subcommands: [
      Set.self,
      Version.self
    ],
    defaultSubcommand: Set.self
  )

  public init() {}
}
