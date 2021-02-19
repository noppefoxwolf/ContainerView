// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Container",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Container",
            targets: ["Container"]
        ),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "Container",
            path: "Sources/ContainerView"
        )
    ]
)
