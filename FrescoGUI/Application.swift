import AppKit

enum Application {
  static func main() {
    let delegate = ApplicationDelegate()
    if #available(macOS 10.14, *) {
      NSApplication.shared.appearance = NSAppearance(named: .aqua)
    } else {
      // Fallback on earlier versions
    }
    NSApplication.shared.delegate = delegate
    _ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
  }
}
