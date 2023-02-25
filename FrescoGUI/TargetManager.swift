import Foundation

class TargetManager {
  static let shared = TargetManager()

  private init() {}

  func applications() -> [URL] {
    [
      FileManager.default.urls(
        for: .applicationDirectory,
        in: .localDomainMask
      ),
      FileManager.default.urls(
        for: .applicationDirectory,
        in: .userDomainMask
      )
    ]
      .flatMap { urls in
        urls
      }
      .map { url in
        guard
          let enumerator = FileManager.default.enumerator(
            at: url,
            includingPropertiesForKeys: [.isApplicationKey],
            options: [.skipsHiddenFiles, .skipsPackageDescendants]
          )
        else {
          return [] as [URL]
        }

        var applications: [URL] = []
        for case let url as URL in enumerator {
          guard
            let attributes = try? url.resourceValues(
              forKeys: [.isApplicationKey]
            ),
            attributes.isApplication == true
          else {
            continue
          }
          applications.append(url)
        }
        return applications
      }
      .flatMap { url in
        url
      }
  }
}
