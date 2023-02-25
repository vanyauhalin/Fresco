import AppKit

struct ArtworkObjectBaseLayout: ConstrainableLayout {
  private enum Constants {
    static let insets = NSEdgeInsets(all: 8)
  }

  static let insets = Constants.insets

  let content: Layoutable

  func layout(in container: Constrainable) -> Constrainable {
    let insetsLayout = InsetsLayout(content: content, insets: Constants.insets)
    return insetsLayout.layout(in: container)
  }
}
