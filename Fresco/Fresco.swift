import ArgumentParser
import Foundation

@main
public struct Fresco: ParsableCommand {
  public static let configuration = CommandConfiguration(
    subcommands: [
      Setup.self,
      Version.self
    ],
    defaultSubcommand: Setup.self
  )

  public init() {}
}
