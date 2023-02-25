import AppKit

class ArtInternalCollectionView: CollectionView {
  // MARK: Life Cycle

  override init() {
    super.init()
    setup()
  }

  // MARK: Setup

  private func setup() {
    backgroundColors = [.clear]
  }
}
