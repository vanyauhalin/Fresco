import AppKit

struct ArtworkObjectPrimaryLayout: LayerableLayout {
  let content: Layoutable

  func setup() {
    guard content.wantsLayer else {
      return
    }
    let layer = ArtworkObjectPrimaryLayer()
    content.layer?.addSublayer(layer)
  }

  func layout(in rectangle: CGRect) {
    guard
      let layer = content.layer(by: ArtworkObjectPrimaryLayer.identifier)
    else {
      return
    }
    layer.frame = rectangle
  }
}
