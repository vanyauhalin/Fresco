import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "FrescoCLI",
  organizationName: "my.vanyauhalin",
  packages: [
    .remote(
      url: "https://github.com/apple/swift-argument-parser",
      requirement: .exact("1.2.0")
    )
  ],
  targets: Environment.production
    ? [
      Target(
        name: "FrescoCLI",
        platform: .macOS,
        product: .commandLineTool,
        bundleId: "my.vanyauhalin.FrescoCLI",
        deploymentTarget: .macOS(targetVersion: "10.13"),
        sources: .relative("*.swift"),
        dependencies: [
          .package(product: "ArgumentParser"),
          .project("FrescoCore")
        ]
      )
    ]
    : [
      Target(
        name: "FrescoCLI",
        platform: .macOS,
        product: .framework,
        bundleId: "my.vanyauhalin.FrescoCLI",
        deploymentTarget: .macOS(targetVersion: "10.13"),
        sources: .relative("*.swift"),
        scripts: [
          .lint("FrescoCLI")
        ],
        dependencies: [
          .package(product: "ArgumentParser"),
          .project("FrescoCore")
        ]
      )
    ]
)
