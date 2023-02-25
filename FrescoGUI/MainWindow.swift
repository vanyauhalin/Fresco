import AppKit

class MainWindow: NSWindow {
  // MARK: Life Cycle

  init() {
    super.init(
      contentRect: .zero,
      styleMask: [
        .closable,
        .miniaturizable,
        .resizable,
        .titled
      ],
      backing: .buffered,
      defer: false
    )
    setup()
  }

  // MARK: Setup

  private func setup() {
    let width = 20 * 3 + (1 * 2 + 16 * 5 + 64 * 4) * 2
    minSize = CGSize(width: width, height: 520)
    title = "Fresco"
    titleVisibility = .hidden
    toolbar = NSToolbar()
    titlebarAppearsTransparent = true
    backgroundColor = .white
  }
}
