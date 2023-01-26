import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "FrescoGUI",
  organizationName: "my.vanyauhalin",
  targets: Environment.production
    ? [
      Target(
        name: "FrescoGUI",
        platform: .macOS,
        product: .app,
        bundleId: "my.vanyauhalin.FrescoGUI",
        sources: .relative("*.swift"),
        dependencies: [
          .project("FrescoCore")
        ]
      )
    ]
    : [
      Target(
        name: "FrescoGUI",
        platform: .macOS,
        product: .framework,
        bundleId: "my.vanyauhalin.FrescoGUI",
        sources: .relative("*.swift"),
        scripts: [
          .lint("FrescoGUI")
        ],
        dependencies: [
          .project("FrescoCore")
        ]
      )
    ]
)
