import AppKit

class ApplicationDelegate: NSObject {
  private let controller: MainWindowController

  override init() {
    self.controller = MainWindowController()
  }
}

extension ApplicationDelegate: NSApplicationDelegate {
  func applicationDidFinishLaunching(
    _ aNotification: Notification
  ) {
    controller.loadWindow()
  }

  func applicationShouldTerminateAfterLastWindowClosed(
    _ sender: NSApplication
  ) -> Bool {
    true
  }
}
