import AppKit

class ArtCollectionLayout: CollectionViewFlowLayout {
  private enum Constants {
    static let minimumInteritemSpacing = 0.0
    static let minimumItemWidth = 80.0
    static let minimumLineSpacing = 8.0
    static let sectionInset = NSEdgeInsets(all: 8)
    static let itemHeight = ArtworkView.height
  }

  // MARK: Life Cycle

  override init() {
    super.init()
    setup()
  }

  // MARK: Setup

  private func setup() {
    minimumInteritemSpacing = Constants.minimumInteritemSpacing
    minimumLineSpacing = Constants.minimumLineSpacing
    scrollDirection = .vertical
    sectionInset = Constants.sectionInset
  }

  // MARK: Calculate

  func calculateItemSize(for width: Double) -> CGSize {
    let itemsPerRow = calculateRowItemsCount(
      for: width,
      itemWidth: Constants.minimumItemWidth
    )
    let width = calculateItemWidth(
      for: width,
      itemsPerRow: itemsPerRow
    )
    return CGSize(width: width, height: Constants.itemHeight)
  }

  private func calculateRowItemsCount(
    for width: Double,
    itemWidth: Double
  ) -> Int {
    let inset = sectionInset.left + sectionInset.right
    let inherit = width - inset
    let count = (inherit + minimumInteritemSpacing)
      / (itemWidth + minimumInteritemSpacing)
    return Int(count.rounded(.towardZero))
  }

  private func calculateItemWidth(
    for width: Double,
    itemsPerRow: Int
  ) -> Double {
    let spacing = minimumInteritemSpacing * Double(itemsPerRow - 1)
    let inset = sectionInset.left + sectionInset.right
    let useful = width - inset - spacing
    let single = useful / Double(itemsPerRow)
    return single.rounded(.towardZero)
  }
}
