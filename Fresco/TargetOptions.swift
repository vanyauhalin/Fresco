import ArgumentParser

/// The options for configuring the target.
public struct TargetOptions: ParsableArguments {
  /// The path to the target file or directory.
  ///
  /// The path to the target can be either absolute or relative. The target can
  /// be a file, directory or application.
  @Argument(
    help: ArgumentHelp(
      "The path to the target file or directory.",
      // swiftlint:disable:next line_length
      discussion: "The path to the target can be either absolute or relative. The target can be a file, directory or application.",
      valueName: "target"
    )
  )
  public var value: String

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
  public var application = false

  public init() {}
}
