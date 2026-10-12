// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "EngineKit",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "EngineKit", targets: ["EngineKit"])
    ],
    dependencies: [
        .package(path: "../VendorWrapper")
    ],
    targets: [
        .target(
            name: "EngineKit",
            dependencies: [.product(name: "VendorWrapper", package: "VendorWrapper")]
        )
    ]
)
