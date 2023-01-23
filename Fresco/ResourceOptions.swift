import ArgumentParser

/// The options for configuring the resource.
public struct ResourceOptions: ParsableArguments {
  /// The path to the resource file.
  ///
  /// The path to the resource file can be either absolute or relative. The
  /// resource file can be in almost any image format, but `.icns` is preferred.
  @Argument(
    help: ArgumentHelp(
      "The path to the resource file.",
      // swiftlint:disable:next line_length
      discussion: "The path to the resource file can be either absolute or relative. The resource file can be in almost any image format, but .icns is preferred.",
      valueName: "resource"
    )
  )
  public var value: String

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
  public var remote = false

  public init() {}
}
