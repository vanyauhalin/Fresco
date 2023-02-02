import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "Fresco",
  organizationName: "my.vanyauhalin",
  packages: [
    .package(
      url: "https://github.com/apple/swift-argument-parser.git",
      from: "1.2.0"
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
        sources: .relative([
          "!FrescoCLI/*Tests.swift",
          "!FrescoCLI/XCTestCase*",
          "FrescoCLI/*.swift"
        ]),
        dependencies: [
          .sdk(name: "AppKit", type: .framework, status: .required),
          .sdk(name: "Foundation", type: .framework, status: .required),
          .package(product: "ArgumentParser")
        ]
      ),
      Target(
        name: "FrescoGUI",
        platform: .macOS,
        product: .app,
        bundleId: "my.vanyauhalin.FrescoGUI",
        sources: .relative([
          "FrescoGUI/*.swift"
        ]),
        dependencies: [
          .sdk(name: "AppKit", type: .framework, status: .required),
          .sdk(name: "Foundation", type: .framework, status: .required)
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
        sources: .relative([
          "!FrescoCLI/*Tests.swift",
          "!FrescoCLI/XCTestCase*",
          "FrescoCLI/*.swift"
        ]),
        scripts: [
          .lint("FrescoCLI")
        ],
        dependencies: [
          .sdk(name: "AppKit", type: .framework, status: .required),
          .sdk(name: "Foundation", type: .framework, status: .required),
          .package(product: "ArgumentParser")
        ]
      ),
      Target(
        name: "FrescoCLITests",
        platform: .macOS,
        product: .unitTests,
        bundleId: "my.vanyauhalin.FrescoCLITests",
        deploymentTarget: .macOS(targetVersion: "10.13"),
        sources: .relative([
          "FrescoCLI/*Tests.swift",
          "FrescoCLI/XCTestCase*"
        ]),
        dependencies: [
          .target(name: "FrescoCLI"),
          .xctest
        ]
      ),
      Target(
        name: "FrescoGUI",
        platform: .macOS,
        product: .app,
        bundleId: "my.vanyauhalin.FrescoGUI",
        sources: .relative([
          "FrescoGUI/*.swift"
        ]),
        scripts: [
          .lint("FrescoGUI")
        ],
        dependencies: [
          .sdk(name: "AppKit", type: .framework, status: .required),
          .sdk(name: "Foundation", type: .framework, status: .required)
        ]
      )
    ]
)
