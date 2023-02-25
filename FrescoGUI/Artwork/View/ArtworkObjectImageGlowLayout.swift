import AppKit

struct ArtworkObjectImageGlowLayout: LayerableLayout {
  let content: Layoutable

  func setup() {
    guard content.wantsLayer else {
      return
    }
    let layer = ArtworkObjectImageGlowLayer()
    content.layer?.addSublayer(layer)
  }

  func layout(in rectangle: CGRect) {
    guard
      let layer = content.layer(by: ArtworkObjectImageGlowLayer.identifier)
    else {
      return
    }
    layer.frame = rectangle
  }

  func layout(with image: NSImage?) {
    guard
      let image,
      let color = AverageColorService.shared.color(of: image),
      let layer = content.layer(by: ArtworkObjectImageGlowLayer.identifier)
    else {
      return
    }
    layer.shadowColor = color.cgColor
  }
}
