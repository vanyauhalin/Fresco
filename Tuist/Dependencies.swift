import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
  swiftPackageManager: Environment.ci
    ? []
    : [
      .package(url: "https://github.com/realm/SwiftLint.git", .branch("main"))
    ],
  platforms: [
    .macOS
  ]
)
