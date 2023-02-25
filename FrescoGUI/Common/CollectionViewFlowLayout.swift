import AppKit

class CollectionViewFlowLayout: NSCollectionViewFlowLayout {
  override init() {
    super.init()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
