import AppKit

class AverageColorService {
  private enum Constants {
    static let cacheLimit = 512 * 1_024 * 1_024
  }

  static let shared = {
    let cache = AverageColorCache(limit: Constants.cacheLimit)
    return AverageColorService(cache: cache)
  }()

  private let cache: AverageColorCache

  private init(cache: AverageColorCache) {
    self.cache = cache
  }

  func color(of image: NSImage) -> NSColor? {
    if let color = cache.retrieve(for: image) {
      return color
    }

    guard image.isValid else {
      return nil
    }

    var inputImageRectangle = CGRect(
      x: .zero,
      y: .zero,
      width: image.size.width,
      height: image.size.height
    )
    guard
      let inputImageReference = image.cgImage(
        forProposedRect: &inputImageRectangle,
        context: nil,
        hints: nil
      )
    else {
      return nil
    }

    let inputImage = CIImage(cgImage: inputImageReference)
    let inputVector = CIVector(
      x: inputImage.extent.origin.x,
      y: inputImage.extent.origin.y,
      z: inputImage.extent.size.width,
      w: inputImage.extent.size.height
    )

    guard
      let filter = CIFilter(
        name: "CIAreaAverage",
        // swiftlint:disable collection_alignment
        parameters: [
          kCIInputImageKey: inputImage,
          kCIInputExtentKey: inputVector
        ]
        // swiftlint:enable collection_alignment
      ),
      let outputImage = filter.outputImage,
      let space = kCFNull
    else {
      return nil
    }

    // swiftlint:disable:next syntactic_sugar
    var bitmap = Array<UInt8>(repeating: 0, count: 4)
    let context = CIContext(options: [.workingColorSpace: space])
    context.render(
      outputImage,
      toBitmap: &bitmap,
      rowBytes: 4,
      bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
      format: .RGBA8,
      colorSpace: nil
    )

    let color = NSColor(
      red: Double(bitmap[0]) / 255,
      green: Double(bitmap[1]) / 255,
      blue: Double(bitmap[2]) / 255,
      alpha: Double(bitmap[3]) / 255
    )
    cache.cache(color, for: image)

    return color
  }
}
