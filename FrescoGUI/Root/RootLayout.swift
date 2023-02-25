import AppKit

struct RootLayout: LayerableLayout, ConstrainableLayout {
  private enum Constants {
    static let insets = NSEdgeInsets(all: RootLayer.borderWidth)
  }

  var content: Layoutable

  mutating func setup() {
    guard content.wantsLayer else {
      return
    }
    let layer = RootLayer()
    content.layer = layer
  }

  func layout(in rectangle: CGRect) {
    // fatalError("\(#function) has not been implemented")
  }

  func layout(in container: Constrainable) -> Constrainable {
    let insetsLayout = InsetsLayout(content: content, insets: Constants.insets)
    return insetsLayout.layout(in: container)
  }
}
