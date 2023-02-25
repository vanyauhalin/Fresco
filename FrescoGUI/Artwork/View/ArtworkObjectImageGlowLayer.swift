import AppKit

class ArtworkObjectImageGlowLayer: ShapeLayer {
  private enum Constants {
    static let shadowInset = NSEdgeInsets(all: 4.2)
    static let shadowOffset = CGSize.zero
    static let shadowOpacity = 0.6
    static let shadowRadius = 2.6
  }

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
    let size = CGSize(
      width: frame.width
        - Constants.shadowInset.left
        - Constants.shadowInset.right,
      height: frame.height
        - Constants.shadowInset.top
        - Constants.shadowInset.bottom
    )
    path = .empty()
    shadowPath = CGPath(
      roundedRect: CGRect(
        origin: CGPoint(
          x: frame.maxX / 2 - size.width / 2,
          y: frame.maxY / 2 - size.height / 2
        ),
        size: size
      ),
      cornerWidth: size.width / 2,
      cornerHeight: size.height / 2,
      transform: nil
    )
  }

  // MARK: Setup

  private func setup() {
    name = ArtworkObjectImageGlowLayer.identifier
    shadowOffset = Constants.shadowOffset
    shadowOpacity = Float(Constants.shadowOpacity)
    shadowRadius = Constants.shadowRadius
  }
}
