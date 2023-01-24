import ArgumentParser
import Foundation

@main
public struct Fresco: ParsableCommand {
  /// The command to reset the default icon for target.
  public struct Reset: ParsableCommand {
    public static let configuration = CommandConfiguration(
      abstract: "Reset the default icon for target.",
      usage: """
      fresco reset [-a] <target>
      fresco reset ../RegularFile.txt
      fresco reset -a "SF Symbols"
      """
    )

    @OptionGroup
    public var target: TargetOptions

    public init() {}

    public func run() throws {
      let target = try Factory.create(from: target)
      try IconManager.reset(for: target)
    }
  }

  /// The command to set the icon for the target.
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
      Reset.self,
      Set.self,
      Version.self
    ],
    defaultSubcommand: Set.self
  )

  public init() {}
}
