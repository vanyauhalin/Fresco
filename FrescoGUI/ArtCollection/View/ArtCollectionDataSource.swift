import AppKit

class ArtCollectionDataSource: NSObject {
  private enum Identifier: String {
    case item

    var identifier: NSUserInterfaceItemIdentifier {
      NSUserInterfaceItemIdentifier(rawValue: rawValue)
    }
  }

  private var data: ArtCollectionData?

  // MARK: Views

  private weak var collectionView: ArtInternalCollectionView?

  // MARK: Life Cycle

  init(collectionView: ArtInternalCollectionView) {
    self.collectionView = collectionView
    super.init()
    setup()
  }

  // MARK: Setup

  private func setup() {
    collectionView?.register(
      ArtCollectionItem.self,
      forItemWithIdentifier: Identifier.item.identifier
    )
  }

  // MARK: Methods

  func reload(with data: ArtCollectionData) {
    self.data = data
    collectionView?.reloadData()
  }
}

extension ArtCollectionDataSource: NSCollectionViewDataSource {
  func collectionView(
    _ collectionView: NSCollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    // 8
    data?.items.count ?? .zero
  }

  func collectionView(
    _ collectionView: NSCollectionView,
    itemForRepresentedObjectAt indexPath: IndexPath
  ) -> NSCollectionViewItem {
    guard
      let item = collectionView
        .makeItem(
          withIdentifier: Identifier.item.identifier,
          for: indexPath
        )
        as? ArtCollectionItem
    else {
      fatalError("?")
    }
    if let model = data?.items[safe: indexPath.item] {
      item.configure(with: model)
    }
    return item
  }
}
