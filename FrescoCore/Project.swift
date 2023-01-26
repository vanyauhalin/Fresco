import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "FrescoCore",
  organizationName: "my.vanyauhalin",
  targets: Environment.production
    ? [
      Target(
        name: "FrescoCore",
        platform: .macOS,
        product: .staticLibrary,
        bundleId: "my.vanyauhalin.FrescoCore",
        deploymentTarget: .macOS(targetVersion: "10.13"),
        sources: .relative(
          "*.swift",
          excluding: [
            "*Tests.swift",
            "XCTestCase*"
          ]
        )
      )
    ]
    : [
      Target(
        name: "FrescoCore",
        platform: .macOS,
        product: .staticLibrary,
        bundleId: "my.vanyauhalin.FrescoCore",
        deploymentTarget: .macOS(targetVersion: "10.13"),
        sources: .relative(
          "*.swift",
          excluding: [
            "*Tests.swift",
            "XCTestCase*"
          ]
        ),
        scripts: [
          .lint("FrescoCore")
        ]
      ),
      Target(
        name: "FrescoCoreTests",
        platform: .macOS,
        product: .unitTests,
        bundleId: "my.vanyauhalin.FrescoCoreTests",
        deploymentTarget: .macOS(targetVersion: "10.13"),
        sources: [
          "*Tests.swift",
          "XCTestCase*"
        ],
        dependencies: [
          .target(name: "FrescoCore"),
          .xctest
        ]
      )
    ]
)
