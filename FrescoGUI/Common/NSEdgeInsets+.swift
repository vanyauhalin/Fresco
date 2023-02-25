import AppKit

extension NSEdgeInsets {
  init(all: Double) {
    self.init(top: all, left: all, bottom: all, right: all)
  }

  init(top: Double) {
    self.init(top: top, left: .zero, bottom: .zero, right: .zero)
  }

  init(bottom: Double) {
    self.init(top: .zero, left: .zero, bottom: bottom, right: .zero)
  }
}
