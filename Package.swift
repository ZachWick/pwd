// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "pwd",
    dependencies: [],
    targets: [
        .target(
            name: "pwd",
            dependencies: []),
        .testTarget(
            name: "pwdTests",
            dependencies: ["pwd"]),
    ]
)
