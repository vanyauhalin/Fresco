import Foundation
import ProjectDescription

let root = {
  if #available(macOS 13, *) {
    return URL(filePath: FileManager.default.currentDirectoryPath)
  } else {
    return URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
  }
}()

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
