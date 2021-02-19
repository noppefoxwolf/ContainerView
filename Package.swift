// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContainerView",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ContainerView",
            targets: ["ContainerView"]
        ),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "ContainerView"
        )
    ]
)
