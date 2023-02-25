import AppKit

class ArtworkCaptionTextField: TextField {
  private enum Constants {
    static let fontSize = 11.0
    static let lineHeight = 14.0
    static let maximumNumberOfLines = 1
  }

  static let lineHeight = Constants.lineHeight

  // MARK: Life Cycle

  override init() {
    super.init()
    setup()
  }

  // MARK: Setup

  private func setup() {
    alignment = .center
    backgroundColor = .clear
    font = .systemFont(ofSize: Constants.fontSize)
    isBordered = false
    isEditable = false
    lineBreakMode = .byTruncatingTail
    maximumNumberOfLines = Constants.maximumNumberOfLines
    textColor = .black
  }
}
