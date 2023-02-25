import AppKit

class ArtCollectionView: ScrollView {
  private lazy var collectionView = {
    let view = ArtInternalCollectionView()
    view.delegate = self
    return view
  }()

  private lazy var collectionLayout =
    ArtCollectionLayout()

  private lazy var collectionDataSource =
    ArtCollectionDataSource(collectionView: collectionView)

  // MARK: Life Cycle

  override init() {
    super.init()
    setup()
  }

  override func layout() {
    super.layout()
    collectionView.collectionViewLayout?.invalidateLayout()
  }

  // MARK: Setup

  private func setup() {
    collectionView.collectionViewLayout = collectionLayout
    collectionView.dataSource = collectionDataSource
    collectionView.isSelectable = true
    documentView = collectionView
  }

  // MARK: Methods

  func reload(with data: ArtCollectionData) {
    collectionDataSource.reload(with: data)
  }
}

extension ArtCollectionView: NSCollectionViewDelegate {
  func collectionView(
    _ collectionView: NSCollectionView,
    didSelectItemsAt indexPaths: Set<IndexPath>
  ) {
    guard
      let index = indexPaths.first?.last,
      let item = collectionView.item(at: index) as? ArtCollectionItem
    else {
      return
    }
    item.select()
  }
}

extension ArtCollectionView: NSCollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: NSCollectionView,
    layout collectionViewLayout: NSCollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    collectionLayout.calculateItemSize(for: collectionView.frame.width)
  }
}
