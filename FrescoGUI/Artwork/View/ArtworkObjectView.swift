import AppKit

class ArtworkObjectView: View {
  static let height =
    ArtworkObjectContainingLayout.insets.top
    + ArtworkInternalObjectView.height
    + ArtworkObjectContainingLayout.insets.bottom

  // MARK: Views

  private lazy var objectView = ArtworkInternalObjectView()

  // MARK: Life Cycle

  override init() {
    super.init()
    setup()
  }

  // MARK: Setup

  private func setup() {
    setupView()
    let container = setupLayout()
    setupConstraints(in: container)
  }

  private func setupView() {
    addSubview(objectView)
  }

  private func setupLayout() -> Constrainable {
    let layout = ArtworkObjectContainingLayout(content: self)
    return layout.layout(in: self)
  }

  private func setupConstraints(in container: Constrainable) {
    objectView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      objectView.leadingAnchor.constraint(
        equalTo: container.leadingAnchor
      ),
      objectView.topAnchor.constraint(
        equalTo: container.topAnchor
      ),
      objectView.trailingAnchor.constraint(
        equalTo: container.trailingAnchor
      ),
      objectView.bottomAnchor.constraint(
        equalTo: container.bottomAnchor
      )
    ])
  }

  // MARK: Properties

  var image: NSImage? {
    get {
      objectView.image
    }
    set {
      objectView.image = newValue
    }
  }
}
