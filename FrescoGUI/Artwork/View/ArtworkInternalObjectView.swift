import AppKit

protocol Sty {
  func setup()
  func update()
  func teardown()
}

class ArtworkInternalObjectView: View {
  static let height =
    ArtworkObjectBaseLayout.insets.top
    + ArtworkObjectImageView.size.height
    + ArtworkObjectBaseLayout.insets.bottom

  // MARK: Views

  private lazy var imageView = ArtworkObjectImageView()

  // MARK: Life Cycle

  override init() {
    super.init()
    setup()
  }

  override func layout() {
    super.layout()
    let primaryLayout = ArtworkObjectPrimaryLayout(content: self)
    primaryLayout.layout(in: bounds)
    // let selectionLayout = ArtworkObjectSelectionLayout(content: self)
    // selectionLayout.layout(in: bounds)
  }

  // MARK: Setup

  private func setup() {
    setupView()
    let container = setupLayout()
    setupConstraints(in: container)
  }

  private func setupView() {
    wantsLayer = true
    layer?.masksToBounds = false
    addSubview(imageView)
  }

  private func setupLayout() -> Constrainable {
    let baseLayout = ArtworkObjectBaseLayout(content: self)
    let baseContainer = baseLayout.layout(in: self)
    let primaryLayout = ArtworkObjectPrimaryLayout(content: self)
    primaryLayout.setup()
    // let selectionLayout = ArtworkObjectSelectionLayout(content: self)
    // selectionLayout.setup()
    return baseContainer
  }

  private func setupConstraints(in container: Constrainable) {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(
        equalTo: container.leadingAnchor
      ),
      imageView.topAnchor.constraint(
        equalTo: container.topAnchor
      ),
      imageView.trailingAnchor.constraint(
        equalTo: container.trailingAnchor
      ),
      imageView.bottomAnchor.constraint(
        equalTo: container.bottomAnchor
      )
    ])
  }

  // MARK: Properties

  var image: NSImage? {
    get {
      imageView.image
    }
    set {
      imageView.image = newValue
    }
  }
}
