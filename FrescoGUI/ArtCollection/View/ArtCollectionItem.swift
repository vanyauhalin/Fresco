import AppKit

class ArtCollectionItem: NSCollectionViewItem {
  // MARK: Views

  private lazy var contentView = ArtworkView()

  // MARK: Life Cycle

  override func loadView() {
    view = contentView
  }

  // MARK: Methods

  func configure(with model: ArtCollectionModel) {
    contentView.name = model.name
    contentView.image = model.image
  }

  func select() {}
}
