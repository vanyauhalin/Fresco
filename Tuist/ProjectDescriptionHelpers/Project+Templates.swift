import Foundation
import ProjectDescription

let root = {
  if #available(macOS 13, *) {
    return URL(filePath: FileManager.default.currentDirectoryPath)
  } else {
    return URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
  }
}()

extension SourceFilesList {
  public static func relative(_ paths: [String]) -> SourceFilesList {
    let including = paths.filter { path in
      !path.starts(with: "!")
    }
    let excluding = paths
      .filter { path in
        path.starts(with: "!")
      }
      .map { path in
        path.replacingOccurrences(of: "!", with: "")
      }
    return SourceFilesList(
      globs: including.map { path in
        .glob(
          .relativeToManifest(path),
          excluding: excluding.map { path in
            Path(path)
          }
        )
      }
    )
  }
}

extension ProjectDescription.TargetScript {
  private static let makefile = {
    if #available(macOS 13, *) {
      return root.appending(path: "Makefile").path()
    } else {
      return root.appendingPathComponent("Makefile").path
    }
  }()

  private static func make(_ subcommand: String) -> TargetScript {
    .pre(
      script: "make -f \(makefile) \(subcommand)",
      name: "make \(subcommand)"
    )
  }

  public static func lint(_ project: String) -> TargetScript {
    .make("lint project=\(project)")
  }
}
