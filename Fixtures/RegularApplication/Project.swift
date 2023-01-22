import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RegularApplication",
  organizationName: "my.vanyauhalin",
  targets: [
    Target(
      name: "RegularApplication",
      platform: .macOS,
      product: .app,
      bundleId: "my.vanyauhalin.RegularApplication",
      sources: "RegularApplication.swift"
    )
  ]
)
