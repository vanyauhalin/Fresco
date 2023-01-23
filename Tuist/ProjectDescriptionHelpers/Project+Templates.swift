import Foundation
import ProjectDescription

let root = URL(filePath: FileManager.default.currentDirectoryPath)

extension ProjectDescription.TargetScript {
  public static let makefile = root.appending(path: "Makefile").path()

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
