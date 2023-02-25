import CoreGraphics

protocol LayerableLayout {
  var content: Layoutable { get }

  mutating func setup()

  func layout(in rectangle: CGRect)
}
