import CoreGraphics

extension CGPath {
  static func empty() -> CGPath {
    CGPath(
      roundedRect: .zero,
      cornerWidth: .zero,
      cornerHeight: .zero,
      transform: nil
    )
  }
}
