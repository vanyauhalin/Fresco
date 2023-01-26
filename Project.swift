import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "Fresco",
  organizationName: "my.vanyauhalin",
  packages: [
    .remote(
      url: "https://github.com/apple/swift-argument-parser",
      requirement: .exact("1.2.0")
    )
  ],
  targets: [
    Target(
      name: "fresco",
      platform: .macOS,
      product: .commandLineTool,
      bundleId: "my.vanyauhalin.fresco",
      deploymentTarget: .macOS(targetVersion: "10.13"),
      sources: .relative(
        "Fresco/*.swift",
        excluding: ["Fresco/*Tests.swift", "Fresco/XCTestCase*"]
      ),
      dependencies: [
        .package(product: "ArgumentParser")
      ]
    ),
    Target(
      name: "FrescoFramework",
      platform: .macOS,
      product: .framework,
      bundleId: "my.vanyauhalin.FrescoFramework",
      deploymentTarget: .macOS(targetVersion: "10.13"),
      sources: .relative(
        "Fresco/*.swift",
        excluding: ["Fresco/*Tests.swift", "Fresco/XCTestCase*"]
      ),
      scripts: [
        .lint("Fresco")
      ],
      dependencies: [
        .package(product: "ArgumentParser")
      ]
    ),
    Target(
      name: "FrescoTests",
      platform: .macOS,
      product: .unitTests,
      bundleId: "my.vanyauhalin.FrescoTests",
      deploymentTarget: .macOS(targetVersion: "10.13"),
      sources: .relative(
        ["Fresco/*Tests.swift", "Fresco/XCTestCase*"]
      ),
      dependencies: [
        .target(name: "FrescoFramework"),
        .xctest
      ]
    )
  ]
)
