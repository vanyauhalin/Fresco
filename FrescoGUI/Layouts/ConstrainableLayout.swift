protocol ConstrainableLayout {
  var content: Layoutable { get }

  func layout(in container: Constrainable) -> Constrainable
}
