#if os(macOS)
import Cocoa
import SnapshotTesting

extension Snapshotting where Value == CGImage, Format == NSImage {
    public static let image: Snapshotting = Snapshotting<CGImage, NSImage>.init(
        pathExtension: "png",
        diffing: .image) { value in
            NSImage.init(cgImage: value, size: .init(width: value.width, height: value.height))
        }
}

#endif
