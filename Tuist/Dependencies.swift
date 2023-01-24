import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Environment.ci
  ? Dependencies()
  : Dependencies(
    swiftPackageManager: [
      .remote(
        url: "https://github.com/realm/SwiftLint",
        requirement: .branch("main")
      )
    ]
  )
