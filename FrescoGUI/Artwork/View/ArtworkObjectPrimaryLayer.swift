import AppKit

class ArtworkObjectPrimaryLayer: ShapeLayer {
  private enum Constants {
    static let backgroundColor = NSColor.white
    static let borderColor = NSColor(
      red: 215 / 255,
      green: 215 / 255,
      blue: 215 / 255,
      alpha: 1
    )
    static let borderWidth = 1.0
    static let cornerRadius = 10.0
    static let shadowColor = NSColor(
      red: 215 / 255,
      green: 215 / 255,
      blue: 215 / 255,
      alpha: 1
    )
    static let shadowOpacity = 0.8
    static let shadowOffset = CGSize(width: 0, height: -0.8)
    static let shadowRadius = 1.0
  }

  private lazy var borderLayer = {
    let layer = ShapeLayer()
    layer.fillColor = Constants.borderColor.cgColor
    return layer
  }()

  private lazy var backgroundLayer = {
    let layer = ShapeLayer()
    layer.fillColor = Constants.backgroundColor.cgColor
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
      roundedRect: frame,
      cornerWidth: Constants.cornerRadius,
      cornerHeight: Constants.cornerRadius,
      transform: nil
    )
    backgroundLayer.path = CGPath(
      roundedRect: CGRect(
        origin: CGPoint(
          x: frame.minX + Constants.borderWidth,
          y: frame.minY + Constants.borderWidth
        ),
        size: CGSize(
          width: frame.width - Constants.borderWidth * 2,
          height: frame.height - Constants.borderWidth * 2
        )
      ),
      cornerWidth: Constants.cornerRadius - Constants.borderWidth,
      cornerHeight: Constants.cornerRadius - Constants.borderWidth,
      transform: nil
    )
  }

  // MARK: Setup

  private func setup() {
    name = ArtworkObjectPrimaryLayer.identifier
    shadowColor = Constants.shadowColor.cgColor
    shadowOpacity = Float(Constants.shadowOpacity)
    shadowOffset = Constants.shadowOffset
    shadowRadius = Constants.shadowRadius
    addSublayer(borderLayer)
    addSublayer(backgroundLayer)
  }
}
