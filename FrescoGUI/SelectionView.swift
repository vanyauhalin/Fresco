import AppKit

class SelectionView: View {
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
  }

  private func setupLayout() -> Constrainable {
    var rootLayout = RootLayout(content: self)
    rootLayout.setup()
    return rootLayout.layout(in: self)
  }

  private func setupConstraints(in container: Constrainable) {}
}
