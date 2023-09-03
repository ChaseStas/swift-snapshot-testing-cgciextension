#if os(macOS)
import Cocoa
import SnapshotTesting

extension Snapshotting where Value == CIImage, Format == NSImage {
    public static let image: Snapshotting = Snapshotting<CIImage, NSImage>.init(
        pathExtension: "png",
        diffing: .image) { value in
            let context = CIContext(options: nil)
            if let cgImage = context.createCGImage(value, from: value.extent) {
                return NSImage(cgImage: cgImage, size: value.extent.size)
            }
            return NSImage()
        }
}

#endif
