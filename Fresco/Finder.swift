import Foundation

public enum Finder {
  public struct Directory {
    public static let system = Directory(
      urls: FileManager.default.urls(
        for: .applicationDirectory,
        in: .localDomainMask
      )
    )

    public static let user = Directory(
      urls: FileManager.default.urls(
        for: .applicationDirectory,
        in: .userDomainMask
      )
    )

    public let urls: [URL]

    public var applications: [URL] {
      urls.flatMap { url in
        Finder.applications(at: url)
      }
    }

    public init(urls: [URL]) {
      self.urls = urls
    }
  }

  public static func applications(at url: URL) -> [URL] {
    guard
      let enumerator = FileManager.default.enumerator(
        at: url,
        includingPropertiesForKeys: [.isApplicationKey],
        options: [.skipsHiddenFiles, .skipsPackageDescendants]
      )
    else {
      return []
    }

    var applications: [URL] = []
    for case let url as URL in enumerator {
      guard
        let attributes = try? url.resourceValues(forKeys: [.isApplicationKey]),
        attributes.isApplication == true
      else {
        continue
      }
      applications.append(url)
    }
    return applications
  }

  public static func find(
    application name: String,
    in directories: [Directory] = [.system, .user]
  ) -> URL? {
    for directory in directories {
      guard let url = find(application: name, in: directory) else {
        continue
      }
      return url
    }
    return nil
  }

  public static func find(
    application name: String,
    in directory: Directory
  ) -> URL? {
    directory.applications.first { application in
      application.lastPathComponent == name
      || application.deletingPathExtension().lastPathComponent == name
    }
  }
}
