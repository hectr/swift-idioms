// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Idioms",
    platforms: [
        .iOS("8.0"),
        .macOS("10.9"),
        .watchOS("2.0"),
        .tvOS("9.0")
    ],
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
    ],
    swiftLanguageVersions: [.v5]
)
