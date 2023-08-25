// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Styleguide",
	platforms: [.iOS("17.0.0")],
    products: [
        .library(name: "Styleguide", targets: ["Styleguide"]),
    ],
    targets: [
        .target(name: "Styleguide"),
    ]
)
