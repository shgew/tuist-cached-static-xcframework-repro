// swift-tools-version: 5.9
import PackageDescription

#if TUIST
import ProjectDescription

let packageSettings = PackageSettings(
    productTypes: [
        "VendorWrapper": .framework,
        "EngineKit": .framework
    ],
    // The dynamic wrapper must keep the static library's symbols for EngineKit.
    targetSettings: [
        "VendorWrapper": .settings(base: ["OTHER_LDFLAGS": "$(inherited) -all_load"])
    ]
)
#endif

let package = Package(
    name: "Repro",
    dependencies: [
        .package(path: "../Packages/EngineKit")
    ]
)
