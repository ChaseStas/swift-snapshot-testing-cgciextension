#if os(iOS) || os(tvOS)
import SnapshotTesting
import UIKit

extension Snapshotting where Value == CIImage, Format == UIImage {
    public static let image: Snapshotting = Snapshotting<CIImage, UIImage>.init(
        pathExtension: "png",
        diffing: .image) { value in
            let context = CIContext(options: nil)
            if let cgImage = context.createCGImage(value, from: value.extent) {
                return UIImage(cgImage: cgImage)
            }
            return UIImage.emptyImage()
        }
}

#endif
