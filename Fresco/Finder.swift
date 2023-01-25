import Foundation

public class Finder {
  public static let shared = Finder()

  private let fileManager: FileManager

  public init() {
    self.fileManager = .default
  }

  public func fileExists(atPath path: String) -> Bool {
    fileManager.fileExists(atPath: path)
  }

  public func isWritableFile(atPath path: String) -> Bool {
    fileManager.isWritableFile(atPath: path)
  }
}
