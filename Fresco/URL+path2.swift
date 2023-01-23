import Foundation

extension URL {
  /// Wrapper over the `path` method to support older macOS versions.
  public func path2() -> String {
    if #available(macOS 13, *) {
      return path()
    } else {
      return path
    }
  }
}
