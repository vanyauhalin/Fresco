import AppKit

class ArtworkCaptionView: View {
  private enum Constants {
    static let nameFieldHeight = ArtworkCaptionTextField.lineHeight
  }

  static let height = ArtworkCaptionTextField.lineHeight

  // MARK: Views

  private lazy var nameField = ArtworkCaptionTextField()

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
    addSubview(nameField)
  }

  private func setupConstraints() {
    nameField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameField.leadingAnchor.constraint(
        equalTo: leadingAnchor
      ),
      nameField.topAnchor.constraint(
        equalTo: topAnchor
      ),
      nameField.trailingAnchor.constraint(
        equalTo: trailingAnchor
      ),
      nameField.bottomAnchor.constraint(
        equalTo: bottomAnchor
      )
    ])
  }

  // MARK: Properties

  var name: String {
    get {
      nameField.stringValue
    }
    set {
      nameField.stringValue = newValue
    }
  }
}
