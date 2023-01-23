import ProjectDescription

let dependencies = Dependencies(
  swiftPackageManager: [
    .remote(
      url: "https://github.com/realm/SwiftLint",
      requirement: .branch("main")
    )
  ]
)
