import AppKit

struct ArtworkObjectContainingLayout: ConstrainableLayout {
  private enum Constants {
    static let insets = NSEdgeInsets(all: 8)
  }

  static let insets = Constants.insets

  let content: Layoutable

  func layout(in container: Constrainable) -> Constrainable {
    let layout = InsetsLayout(content: content, insets: Constants.insets)
    return layout.layout(in: container)
  }
}
