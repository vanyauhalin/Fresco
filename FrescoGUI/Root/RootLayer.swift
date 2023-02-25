import AppKit

class RootLayer: ShapeLayer {
  private enum Constants {
    static let backgroundColor = NSColor(
      red: 245 / 255,
      green: 245 / 255,
      blue: 245 / 255,
      alpha: 1
    )
    static let borderColor = NSColor(
      red: 235 / 255,
      green: 235 / 255,
      blue: 235 / 255,
      alpha: 1
    )
    static let borderWidth = 1.0
    static let cornerRadius = 10.0
  }

  static let borderWidth = Constants.borderWidth

  // MARK: Life Cycle

  override init() {
    super.init()
    setup()
  }

  override init(layer: Any) {
    super.init(layer: layer)
  }

  // MARK: Setup

  private func setup() {
    backgroundColor = Constants.backgroundColor.cgColor
    borderColor = Constants.borderColor.cgColor
    borderWidth = Constants.borderWidth
    cornerRadius = Constants.cornerRadius
  }
}
