import AppKit

class ArtworkObjectImageView: ImageView {
  private enum Constants {
    static let size = CGSize(all: 48)
  }

  static let size = Constants.size

  // MARK: Life Cycle

  override init() {
    super.init()
    setup()
  }

  override func layout() {
    super.layout()
    let glowLayout = ArtworkObjectImageGlowLayout(content: self)
    glowLayout.layout(in: bounds)
    glowLayout.layout(with: image)
  }

  // MARK: Setup

  private func setup() {
    setupView()
    setupLayout()
  }

  private func setupView() {
    wantsLayer = true
    image?.size = Constants.size
  }

  private func setupLayout() {
    let glowLayout = ArtworkObjectImageGlowLayout(content: self)
    glowLayout.setup()
  }
}
