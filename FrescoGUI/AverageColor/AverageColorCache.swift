import AppKit

class AverageColorCache {
  private let cache = NSCache<NSImage, NSColor>()

  init(limit: Int) {
    cache.totalCostLimit = limit
  }

  func cache(_ value: NSColor, for key: NSImage) {
    cache.setObject(value, forKey: key)
  }

  func retrieve(for key: NSImage) -> NSColor? {
    cache.object(forKey: key) as NSColor?
  }

  func remove(for key: NSImage) {
    cache.removeObject(forKey: key)
  }

  func clear() {
    cache.removeAllObjects()
  }
}
