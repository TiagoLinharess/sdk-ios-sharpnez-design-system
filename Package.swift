// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharpnezDesignSystem",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "SharpnezDesignSystem",
            targets: ["SharpnezDesignSystem"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/marinofelipe/CurrencyText.git", from: .init(2, 3, 1)
        )
    ],
    targets: [
        .target(
            name: "SharpnezDesignSystem",
            dependencies: [
                .product(name: "CurrencyTextSwiftUI", package: "CurrencyText")
            ],
            path: "SharpnezDesignSystem/SharpnezDesignSystem",
            sources: ["Source"],
            resources: [
                .process("Resources")
            ],
            swiftSettings: [
                .define("ENABLE_LIBRARY_EVOLUTION", .when(configuration: .release)),
                .unsafeFlags(["-enable-library-evolution", "-emit-module-interface"])
            ]
        )
    ]
)
