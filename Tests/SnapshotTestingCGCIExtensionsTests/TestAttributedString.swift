#if canImport(UIKit)
import UIKit
#endif
#if canImport(Cocoa)
import Cocoa
#endif

enum TestAttributedString {
    static func generate() -> CGImage? {
#if canImport(UIKit)
        let attributedString = NSAttributedString(
            string: "ABCDEifg\nhijk\nlmnop",
            attributes: [
                .font: UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor.red
            ]
        )
        
        let size = CGSize(width: 100, height: 70)
        let textRect = CGRect(origin: .zero, size: size)
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(bounds: textRect, format: format)
        
        let action: (UIGraphicsImageRendererContext) -> Void = { (ctx) in
            attributedString.draw(in: textRect)
        }
        
        let data = renderer.pngData(actions: action)
        
        guard let imageSource = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
        return CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
#elseif canImport(Cocoa)
        let attributedString = NSAttributedString(
            string: "ABCDEifg\nhijk\nlmnop",
            attributes: [
                .font: NSFont.systemFont(ofSize: 15),
                .foregroundColor: NSColor.red
            ]
        )
        
        let size = NSSize(width: 100, height: 70)
        let textRect = NSRect(origin: .zero, size: size)
        
        let context = CGContext(
            data: nil,
            width: Int(size.width),
            height: Int(size.height),
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        )
        
        let graphicsContext = NSGraphicsContext(cgContext: context!, flipped: false)
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = graphicsContext
        
        attributedString.draw(in: textRect)
        
        NSGraphicsContext.restoreGraphicsState()
        
        return context?.makeImage()
#endif
    }
}
