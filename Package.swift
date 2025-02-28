// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "sdk-ios-sharpnez-design-system",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "sdk-ios-sharpnez-design-system",
            targets: ["sdk-ios-sharpnez-design-system"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "sdk-ios-sharpnez-design-system"),
        .testTarget(
            name: "sdk-ios-sharpnez-design-systemTests",
            dependencies: ["sdk-ios-sharpnez-design-system"]
        ),
    ]
)
