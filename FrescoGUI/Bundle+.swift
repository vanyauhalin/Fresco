import Foundation

extension Bundle {
  // MARK: Naming

  /// A user-visible short name for the bundle.
  var bundleName: String? {
    infoDictionary?["CFBundleName"] as? String
  }

  /// The user-visible name for the bundle, used by Siri and visible on the iOS
  /// Home screen.
  var bundleDisplayName: String? {
    infoDictionary?["CFBundleDisplayName"] as? String
  }
}
