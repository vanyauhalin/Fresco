import AppKit

class WindowController: NSWindowController {
  init() {
    super.init(window: nil)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
