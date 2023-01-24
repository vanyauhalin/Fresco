import AppKit

public struct Resource {
  /// The resource URL.
  ///
  /// Depending on how the `Resource` is initialized, the URL may contain the
  /// path to the local file (`/`) or the remote one (`http://`).
  public let url: URL

  /// The resource data.
  public let data: Data

  /// The resource image.
  public let image: NSImage

  /// Creates a `Resource` that refers to the local file or directory.
  ///
  /// Returns `nil` if the resource at the provided path does not exist or is
  /// invalid.
  public init?(path: String) {
    let url = URL(filePath2: path)
    let path = url.path2()
    guard
      FileManager.default.fileExists(atPath: path),
      let data = FileManager.default.contents(atPath: path),
      let image = NSImage(data: data),
      image.isValid
    else {
      return nil
    }
    self.url = url
    self.data = data
    self.image = image
  }

  /// Creates a `Resource` that refers to the remote file.
  ///
  /// Returns `nil` if the provided string does not represent a valid URL, or if
  /// the resource loaded at this URL is invalid.
  public init?(string: String) {
    guard
      let url = URL(string: string),
      let data = try? Data(contentsOf: url),
      let image = NSImage(data: data),
      image.isValid
    else {
      return nil
    }
    self.url = url
    self.data = data
    self.image = image
  }
}
