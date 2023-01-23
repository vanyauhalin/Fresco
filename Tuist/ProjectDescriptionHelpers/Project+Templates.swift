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
  public static func relative(
    _ path: String,
    excluding: [Path] = []
  ) -> SourceFilesList {
    SourceFilesList(
      globs: [
        .glob(
          .relativeToManifest(path),
          excluding: excluding
        )
      ]
    )
  }

  public static func relative(
    _ path: [String]
  ) -> SourceFilesList {
    SourceFilesList(
      globs: path.map { item in
        .glob(.relativeToManifest(item))
      }
    )
  }
}

extension ProjectDescription.TargetScript {
  public static let makefile = {
    if #available(macOS 13, *) {
      return root.appending(path: "Makefile").path()
    } else {
      return root.appendingPathComponent("Makefile").path
    }
  }()

  public static func make(_ subcommand: String) -> TargetScript {
    .pre(
      script: "make -f \(makefile) \(subcommand)",
      name: "make \(subcommand)"
    )
  }

  public static func lint() -> TargetScript {
    .make("lint")
  }
}
