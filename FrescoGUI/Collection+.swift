extension Collection {
  /// Safely returns the element at the specified index if it is within bounds.
  subscript (safe index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
}
