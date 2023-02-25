import AppKit

struct ArtworkObjectSelectionLayout: LayerableLayout {
  let content: Layoutable

  func setup() {
    guard content.wantsLayer else {
      return
    }
    let layer = ArtworkObjectSelectionLayer()
    if let first = content.layer?.sublayers?.first {
      content.layer?.insertSublayer(layer, below: first)
      return
    }
    content.layer?.addSublayer(layer)
  }

  func layout(in rectangle: CGRect) {
    guard
      let layer = content.layer(by: ArtworkObjectSelectionLayer.identifier)
    else {
      return
    }
    layer.frame = rectangle
  }
}
