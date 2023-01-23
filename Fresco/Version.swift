import ArgumentParser

/// The command to print the current fresco version.
public struct Version: ParsableCommand {
  /// The current fresco version.
  public static let current = "0.1.0"

  public static let configuration = CommandConfiguration(
    abstract: "Print the current fresco version."
  )

  public init() {}

  public func run() {
    print(Version.current)
  }
}
