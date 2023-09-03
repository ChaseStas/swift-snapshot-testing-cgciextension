// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnapshotTestingCGCIExtensions",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "SnapshotTestingCGCIExtensions",
            targets: ["SnapshotTestingCGCIExtensions"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "SnapshotTestingCGCIExtensions",
            dependencies: [
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]),
        .testTarget(
            name: "SnapshotTestingCGCIExtensionsTests",
            dependencies: ["SnapshotTestingCGCIExtensions"]),
    ]
)
