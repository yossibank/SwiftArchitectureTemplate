// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Utility",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Utility",
            type: .dynamic,
            targets: [
                "Utility"
            ]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Utility",
            dependencies: []
        ),
        .testTarget(
            name: "UtilityTests",
            dependencies: [
                "Utility"
            ]
        )
    ]
)
