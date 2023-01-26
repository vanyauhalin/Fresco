import Foundation

extension URL {
  /// Wrapper over the `filePath` initialization to support older macOS
  /// versions.
  public init(filePath2: String) {
    if #available(macOS 13, *) {
      self.init(filePath: filePath2)
    } else {
      self.init(fileURLWithPath: filePath2)
    }
  }
}
