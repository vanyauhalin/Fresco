import AppKit

// class Reference<Value> {
//   typealias Listener = (Value) -> Void
//
//   var listener: Listener?
//
//   var value: Value {
//     didSet {
//       listener?(value)
//     }
//   }
//
//   init(_ value: Value) {
//     self.value = value
//   }
//
//   func bind(listener: Listener?) {
//     self.listener = listener
//     self.listener?(value)
//   }
// }

class TargetManagerViewModel {
  var data: ArtCollectionData?

  init() {}

  func fetch() {
    let applications = TargetManager.shared.applications()
    let items = applications.map { application in
      let bundle = Bundle(path: application.path)
      let name = bundle?.bundleName ?? application.deletingLastPathComponent().lastPathComponent
      let image = NSWorkspace.shared.icon(forFile: application.path)
      image.size = CGSize(all: 48)
      return ArtCollectionModel(name: name, image: image)
    }
    self.data = ArtCollectionData(items: items)
  }
}

class TargetManagerView: View {
  private let viewModel = TargetManagerViewModel()

  // MARK: Views

  private lazy var collectionView = ArtCollectionView()

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
    wantsLayer = true
    addSubview(collectionView)

    viewModel.fetch()
    if let data = viewModel.data {
      collectionView.reload(with: data)
    }
  }

  private func setupLayout() -> Constrainable {
    var rootLayout = RootLayout(content: self)
    rootLayout.setup()
    return rootLayout.layout(in: self)
  }

  private func setupConstraints(in container: Constrainable) {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(
        equalTo: container.leadingAnchor
      ),
      collectionView.topAnchor.constraint(
        equalTo: container.topAnchor
      ),
      collectionView.trailingAnchor.constraint(
        equalTo: container.trailingAnchor
      ),
      collectionView.bottomAnchor.constraint(
        equalTo: container.bottomAnchor
      )
    ])
  }
}
