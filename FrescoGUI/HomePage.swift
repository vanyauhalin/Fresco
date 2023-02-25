import AppKit

// ReplacementView / ReplacementPage

class HomePage: View {
  private lazy var gridView = TargetManagerView()
  private lazy var gridView2 = SelectionView()

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
    wantsLayer = true
    addSubview(gridView)
    // addSubview(gridView3)
    addSubview(gridView2)
  }

  private func setupConstraints() {
    gridView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      gridView.leadingAnchor.constraint(
        equalTo: leadingAnchor,
        constant: 20
      ),
      gridView.topAnchor.constraint(
        equalTo: topAnchor
      ),
      gridView.trailingAnchor.constraint(
        equalTo: centerXAnchor,
        constant: -10
      ),
      gridView.bottomAnchor.constraint(
        equalTo: bottomAnchor,
        constant: -20
      )
    ])

    // gridView3.translatesAutoresizingMaskIntoConstraints = false
    // NSLayoutConstraint.activate([
    //   gridView3.centerXAnchor.constraint(
    //     equalTo: centerXAnchor
    //   ),
    //   gridView3.centerYAnchor.constraint(
    //     equalTo: centerYAnchor
    //   ),
    //   gridView3.widthAnchor.constraint(
    //     equalToConstant: 6
    //   ),
    //   gridView3.heightAnchor.constraint(
    //     equalToConstant: 8
    //   )
    // ])

    gridView2.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      gridView2.leadingAnchor.constraint(
        equalTo: centerXAnchor,
        constant: 10
      ),
      gridView2.topAnchor.constraint(
        equalTo: topAnchor
      ),
      gridView2.trailingAnchor.constraint(
        equalTo: trailingAnchor,
        constant: -20
      ),
      gridView2.bottomAnchor.constraint(
        equalTo: bottomAnchor,
        constant: -20
      )
    ])
  }
}
