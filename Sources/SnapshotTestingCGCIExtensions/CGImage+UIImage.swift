#if os(iOS) || os(tvOS)
import SnapshotTesting
import UIKit

extension Snapshotting where Value == CGImage, Format == UIImage {
    public static let image: Snapshotting = Snapshotting<CGImage, UIImage>.init(
        pathExtension: "png",
        diffing: .image) { value in
            UIImage.init(cgImage: value)
        }
}

#endif
