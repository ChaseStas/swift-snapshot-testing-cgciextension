import SnapshotTesting
import XCTest
@testable import SnapshotTestingCGCIExtensions
#if canImport(UIKit)
import UIKit
#endif
#if canImport(Cocoa)
import Cocoa
#endif

final class SnapshotTestingCGCIExtensionsTests: XCTestCase {
    func testTextSnapshot() {
        let textImage = TestAttributedString.generate()
        XCTAssertNotNil(textImage)

        let ciimage = CIImage(cgImage: textImage!)

#if canImport(UIKit)
        assertSnapshot(of: ciimage, as: .image, named: "ios")
#elseif canImport(Cocoa)
        assertSnapshot(of: ciimage, as: .image, named: "macos")
#endif
    }

    func testTextWithAlphaSnapshot() {
        let textImage = TestAttributedString.generate()
        XCTAssertNotNil(textImage)

        let ciimage = CIImage(cgImage: textImage!)
        let alpha = 0.5

        let filteredImage = {
            let filter = CIFilter(name: "CIColorMatrix")
            filter?.setDefaults()
            filter?.setValue(ciimage, forKey: kCIInputImageKey)
            let alphaVector = CIVector.init(x: 0, y: 0, z: 0, w: alpha)
            filter?.setValue(alphaVector, forKey: "inputAVector")
            if let outputImage = filter?.outputImage {
                return outputImage
            }
            return ciimage
        }()

#if canImport(UIKit)
        assertSnapshot(of: filteredImage, as: .image, named: "ios")
#elseif canImport(Cocoa)
        assertSnapshot(of: filteredImage, as: .image, named: "macos")
#endif
    }

    // MARK: - CGImage
    func testCGImageSnapshot() {
        let textImage = TestAttributedString.generate()
        XCTAssertNotNil(textImage)

#if canImport(UIKit)
        assertSnapshot(of: textImage!, as: .image, named: "ios")
#elseif canImport(Cocoa)
        assertSnapshot(of: textImage!, as: .image, named: "macos")
#endif
    }
}
