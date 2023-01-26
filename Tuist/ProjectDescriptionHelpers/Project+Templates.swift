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
          excluding: excluding + ["Project.swift"]
        )
      ]
    )
  }

  public static func relative(
    _ path: [String]
  ) -> SourceFilesList {
    SourceFilesList(
      globs: path.map { item in
        .glob(
          .relativeToManifest(item),
          excluding: "Project.swift"
        )
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

  public static func lint(_ project: String) -> TargetScript {
    .make("lint project=\(project)")
  }
}

extension ProjectDescription.TargetDependency {
  public static func project(_ target: String) -> TargetDependency {
    .project(target: target, path: .relativeToRoot(target))
  }
}
