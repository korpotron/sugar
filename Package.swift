// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Sugar",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "Sugar",
            targets: [
                "Sugar",
            ]
        ),
    ],
    targets: [
        .target(
            name: "Sugar"
        ),
        .testTarget(
            name: "SugarTests",
            dependencies: [
                "Sugar",
            ]
        ),
    ]
)
