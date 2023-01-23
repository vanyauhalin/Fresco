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
      sources: [
        "Fresco/Finder.swift",
        "Fresco/Fresco.swift",
        "Fresco/Resource.swift",
        "Fresco/Setup.swift",
        "Fresco/Target.swift",
        "Fresco/Version.swift"
      ],
      dependencies: [
        .package(product: "ArgumentParser")
      ]
    ),
    Target(
      name: "FrescoFramework",
      platform: .macOS,
      product: .framework,
      bundleId: "my.vanyauhalin.FrescoFramework",
      sources: [
        "Fresco/Finder.swift",
        "Fresco/Fresco.swift",
        "Fresco/Resource.swift",
        "Fresco/Setup.swift",
        "Fresco/Target.swift",
        "Fresco/Version.swift"
      ],
      scripts: [
        .lint()
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
      sources: [
        "Fresco/ResourceTests.swift",
        "Fresco/TargetTests.swift",
        "Fresco/VersionTests.swift",
        "Fresco/XCTestCase+root.swift",
        "Fresco/XCTestCase+setUp.swift"
      ],
      dependencies: [
        .target(name: "FrescoFramework"),
        .xctest
      ]
    )
  ]
)