# Cached wrapper loses a static xcframework's module map

Minimal project for a Tuist binary-cache issue.

## Graph

```
App (app) → Feature (framework) → EngineKit (external, dynamic) → VendorWrapper (external, dynamic) → CVendor (static C xcframework with module.modulemap)
```

`EngineKit` does `import CVendor`, so anything compiling against `EngineKit.swiftmodule` needs the `CVendor` module map. `CVendor.xcframework` is checked in; `vendor-src/build-xcframework.sh` rebuilds it.

## Reproduce

```sh
mise install            # Tuist 4.212.0 (also fails on 4.213.0-rc.1)
tuist install
tuist cache             # stores EngineKit, Feature, VendorWrapper
tuist generate --no-open
xcodebuild build -workspace App.xcworkspace -scheme App \
  -destination 'generic/platform=iOS Simulator' -derivedDataPath DerivedData
```

Fails with:

```
Unable to resolve module dependency: 'CVendor' (in target 'Feature' from project 'App')
note: A dependency of Swift module 'EngineKit': '.../EngineKit.framework/Modules/EngineKit.swiftmodule/arm64-apple-ios-simulator.swiftmodule'
note: A dependency of main module 'Feature'
```

Control: `tuist generate --no-open --cache-profile none` followed by the same build succeeds.
