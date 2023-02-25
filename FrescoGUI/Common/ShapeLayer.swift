import QuartzCore

class ShapeLayer: CAShapeLayer {
  override init() {
    super.init()
  }

  override init(layer: Any) {
    super.init(layer: layer)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ShapeLayer {
  static var identifier: String {
    String(describing: Self.self)
  }
}
