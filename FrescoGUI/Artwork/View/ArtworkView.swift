import AppKit

class ArtworkView: View {
  private enum Constants {
    static let verticalSpacing = 2.0
  }

  struct Style {}

  static let height =
    ArtworkObjectView.height
    + Constants.verticalSpacing
    + ArtworkCaptionView.height

  // MARK: Views

  private lazy var objectView = ArtworkObjectView()
  private lazy var captionView = ArtworkCaptionView()

  // MARK: Life Cycle

  override init() {
    super.init()
    setup()
  }

  // MARK: Setup

  private func setup() {
    setupView()
    setupConstraints()
  }

  private func setupView() {
    addSubview(objectView)
    addSubview(captionView)
  }

  private func setupConstraints() {
    objectView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      objectView.leadingAnchor.constraint(
        equalTo: leadingAnchor
      ),
      objectView.topAnchor.constraint(
        equalTo: topAnchor
      ),
      objectView.trailingAnchor.constraint(
        equalTo: trailingAnchor
      ),
      objectView.bottomAnchor.constraint(
        equalTo: captionView.topAnchor,
        constant: -Constants.verticalSpacing
      )
    ])

    captionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      captionView.leadingAnchor.constraint(
        equalTo: leadingAnchor
      ),
      captionView.trailingAnchor.constraint(
        equalTo: trailingAnchor
      ),
      captionView.bottomAnchor.constraint(
        equalTo: bottomAnchor
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

  var name: String {
    get {
      captionView.name
    }
    set {
      captionView.name = newValue
    }
  }

  // var style: Style? {
  //   didSet {
  // 
  //   }
  // }
}
