import AppKit

public struct Target {
  /// Set of supported target types in `URLResourceKey` format.
  public static let supported: Set<URLResourceKey> = [
    .isApplicationKey,
    .isDirectoryKey,
    .isRegularFileKey
  ]

  /// The target URL.
  public let url: URL

  /// Creates a `Target` that refers to the local file or directory.
  ///
  /// Returns `nil` if the target at the provided path does not exist or is not
  /// supported.
  public init?(path: String) {
    let url = URL(filePath2: path).absoluteURL
    guard
      let attributes = try? url.resourceValues(forKeys: Target.supported),
      [
        attributes.isApplication,
        attributes.isDirectory,
        attributes.isRegularFile
      ]
        .contains(true)
    else {
      return nil
    }
    self.url = url
  }

  /// Creates a `Target` from the application name.
  ///
  /// Returns `nil` if the application with the provided name is not found.
  public init?(application name: String) {
    let url = TargetManager.shared.applications().first { application in
      application.lastPathComponent == name
      || application.deletingPathExtension().lastPathComponent == name
    }
    guard let url else {
      return nil
    }
    self.url = url
  }
}
