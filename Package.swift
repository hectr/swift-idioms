// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Idioms",
    products: [
        .library(
            name: "Idioms",
            targets: ["Idioms"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Idioms",
            dependencies: []),
        .testTarget(
            name: "IdiomsTests",
            dependencies: ["Idioms"]),
    ]
)
