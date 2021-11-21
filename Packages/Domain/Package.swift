// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Domain",
            targets: [
                "Domain"
            ]
        )
    ],
    dependencies: [
        .package(url: "../Data", from: "1.0.0"),
        .package(url: "../Utility", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [
                .product(name: "Data", package: "Data"),
                .product(name: "Utility", package: "Utility")
            ]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: [
                "Domain"
            ]
        )
    ]
)
