import Foundation

public final class TargetManager {
  public static let shared = TargetManager()

  private let fileManager: FileManager

  private var systemApplications: [URL] {
    let urls = fileManager.urls(
      for: .applicationDirectory,
      in: .localDomainMask
    )
    return applications(at: urls)
  }

  private var userApplications: [URL] {
    let urls = fileManager.urls(
      for: .applicationDirectory,
      in: .userDomainMask
    )
    return applications(at: urls)
  }

  private init() {
    self.fileManager = .default
  }

  private func applications(at urls: [URL]) -> [URL] {
    urls.flatMap { url in
      applications(at: url)
    }
  }

  private func applications(at url: URL) -> [URL] {
    guard
      let enumerator = fileManager.enumerator(
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

  public func applications() -> [URL] {
    [systemApplications, userApplications].flatMap { url in
      url
    }
  }
}
