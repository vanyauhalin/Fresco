import AppKit

protocol Layoutable {
  var layer: CALayer? { get set }
  var wantsLayer: Bool { get }

  func addLayoutGuide(_ guide: NSLayoutGuide)
  func layer(by name: String) -> CALayer?
}

extension Layoutable {
  func layer(by name: String) -> CALayer? {
    layer?.sublayers?.first { layer in
      layer.name == name
    }
  }
}
