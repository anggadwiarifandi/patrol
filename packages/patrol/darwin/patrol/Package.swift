// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "patrol",
    platforms: [
        .iOS("12.0"),
        .macOS("10.14")
    ],
    products: [
        .library(name: "patrol", targets: [
            "PatrolObjC",
            "patrol"
        ])
    ],
    dependencies: [
        .package(url: "https://github.com/robbiehanson/CocoaAsyncSocket.git", from: "7.6.5"),
    ],
    targets: [
        .target(
            name: "PatrolObjC",
            path: "Sources/patrol/ObjC",
            publicHeadersPath: "include"
        ),
        .target(
            name: "patrol",
            dependencies: [
              "PatrolObjC",
              .product(name: "CocoaAsyncSocket", package: "CocoaAsyncSocket")
            ],
            path: "Sources/patrol/Swift",
            resources: [
                .process("PrivacyInfo.xcprivacy"),
                .process("../Resources/de.lproj/Localizable.strings"),
                .process("../Resources/en.lproj/Localizable.strings"),
                .process("../Resources/fr.lproj/Localizable.strings"),
                .process("../Resources/pl.lproj/Localizable.strings"),
            ],
        )
    ],
    swiftLanguageVersions: [.v5]
)