import AppKit

class MainViewController: ViewController {
  private lazy var contentView = View()
  private lazy var homePage = HomePage()

  // MARK: Life Cycle

  override init() {
    super.init()
    setup()
  }

  override func loadView() {
    view = contentView
  }

  // MARK: Setup

  private func setup() {
    setupView()
    setupConstraints()
  }

  private func setupView() {
    contentView.addSubview(homePage)
  }

  private func setupConstraints() {
    homePage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      homePage.leadingAnchor.constraint(
        equalTo: contentView.leadingAnchor
      ),
      homePage.topAnchor.constraint(
        equalTo: contentView.topAnchor
      ),
      homePage.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor
      ),
      homePage.bottomAnchor.constraint(
        equalTo: contentView.bottomAnchor
      )
    ])
  }
}
