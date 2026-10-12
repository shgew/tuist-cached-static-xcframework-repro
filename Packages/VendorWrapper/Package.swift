// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "VendorWrapper",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "VendorWrapper", targets: ["VendorWrapper"])
    ],
    targets: [
        .target(name: "VendorWrapper", dependencies: ["CVendor"]),
        .binaryTarget(name: "CVendor", path: "CVendor.xcframework")
    ]
)
