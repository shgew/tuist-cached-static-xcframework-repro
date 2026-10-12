import ProjectDescription

let project = Project(
    name: "App",
    targets: [
        .target(
            name: "App",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.example.repro.app",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["App/**"],
            dependencies: [.target(name: "Feature")]
        ),
        .target(
            name: "Feature",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.example.repro.feature",
            deploymentTargets: .iOS("17.0"),
            sources: ["Feature/**"],
            dependencies: [.external(name: "EngineKit")]
        )
    ]
)
