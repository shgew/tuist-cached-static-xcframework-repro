#!/bin/sh
# Builds Packages/VendorWrapper/CVendor.xcframework: a static C library with a module map.
set -eu
cd "$(dirname "$0")"
out=build
rm -rf "$out" ../Packages/VendorWrapper/CVendor.xcframework
mkdir -p "$out/device" "$out/simulator"
xcrun --sdk iphoneos clang -c vendor.c -o "$out/device/vendor.o" -target arm64-apple-ios15.0 -IHeaders
xcrun --sdk iphonesimulator clang -c vendor.c -o "$out/simulator/vendor-arm64.o" -target arm64-apple-ios15.0-simulator -IHeaders
xcrun --sdk iphonesimulator clang -c vendor.c -o "$out/simulator/vendor-x86_64.o" -target x86_64-apple-ios15.0-simulator -IHeaders
xcrun libtool -static -o "$out/device/libvendor.a" "$out/device/vendor.o"
xcrun libtool -static -o "$out/simulator/libvendor.a" "$out/simulator/vendor-arm64.o" "$out/simulator/vendor-x86_64.o"
xcodebuild -create-xcframework \
  -library "$out/device/libvendor.a" -headers Headers \
  -library "$out/simulator/libvendor.a" -headers Headers \
  -output ../Packages/VendorWrapper/CVendor.xcframework
rm -rf "$out"
