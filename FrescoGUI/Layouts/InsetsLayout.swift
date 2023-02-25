import AppKit

struct InsetsLayout: ConstrainableLayout {
  let content: Layoutable
  let insets: NSEdgeInsets

  func layout(in container: Constrainable) -> Constrainable {
    let layout = NSLayoutGuide()
    content.addLayoutGuide(layout)

    NSLayoutConstraint.activate([
      layout.leadingAnchor.constraint(
        equalTo: container.leadingAnchor,
        constant: insets.left
      ),
      layout.topAnchor.constraint(
        equalTo: container.topAnchor,
        constant: insets.top
      ),
      layout.trailingAnchor.constraint(
        equalTo: container.trailingAnchor,
        constant: -insets.right
      ),
      layout.bottomAnchor.constraint(
        equalTo: container.bottomAnchor,
        constant: -insets.bottom
      )
    ])

    return layout
  }
}
