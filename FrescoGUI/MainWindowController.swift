import AppKit

class MainWindowController: WindowController {
  private lazy var contentWindow = {
    let window = MainWindow()
    window.contentViewController = MainViewController()
    window.center()
    window.makeKeyAndOrderFront(self)
    return window
  }()

  // MARK: Life Cycle

  override func loadWindow() {
    self.window = contentWindow
  }
}
