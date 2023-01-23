import Foundation

extension URL {
  /// Wrapper over the `appending` method to support older macOS versions.
  public func appending2(path: String) -> URL {
    if #available(macOS 13, *) {
      return appending(path: path)
    } else {
      return appendingPathComponent(path)
    }
  }
}
