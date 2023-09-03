import SnapshotTesting
#if os(iOS) || os(tvOS)
import UIKit

extension UIImage {
    /// Used when the image size has no width or no height to generated the default empty image
    static func emptyImage() -> UIImage {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 80))
        label.backgroundColor = .red
        label.text = "Error: No image could be generated for this view as its size was zero. Please set an explicit size in the test."
        label.textAlignment = .center
        label.numberOfLines = 3
        return label.asImage()
    }
}

extension UILabel {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

#endif
