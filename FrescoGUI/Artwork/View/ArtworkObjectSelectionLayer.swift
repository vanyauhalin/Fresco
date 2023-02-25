import AppKit

class ArtworkObjectSelectionLayer: ShapeLayer {
  private enum Constants {
    static let borderColor = NSColor.red
    static let borderWidth = 3.0
    static let cornerRadius = 10.0
  }

  private lazy var borderLayer = {
    let layer = ShapeLayer()
    layer.fillColor = Constants.borderColor.cgColor
    return layer
  }()

  // MARK: Life Cycle

  override init() {
    super.init()
    setup()
  }

  override init(layer: Any) {
    super.init(layer: layer)
  }

  override func layoutSublayers() {
    super.layoutSublayers()
    borderLayer.path = CGPath(
      roundedRect: CGRect(
        origin: CGPoint(
          x: frame.minX - Constants.borderWidth,
          y: frame.minY - Constants.borderWidth
        ),
        size: CGSize(
          width: frame.width + Constants.borderWidth * 2,
          height: frame.height + Constants.borderWidth * 2
        )
      ),
      cornerWidth: Constants.cornerRadius + Constants.borderWidth,
      cornerHeight: Constants.cornerRadius + Constants.borderWidth,
      transform: nil
    )
  }

  // MARK: Setup

  private func setup() {
    cornerRadius = Constants.cornerRadius + Constants.borderWidth
    name = ArtworkObjectSelectionLayer.identifier
    addSublayer(borderLayer)
  }
}
