// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XCAOpenAIClient",
    platforms: [
        .iOS(.v16), .macOS(.v14), .tvOS(.v17), .watchOS(.v10), .visionOS(.v1)
    ],
    products: [
        .library(
            name: "XCAOpenAIClient",
            targets: ["XCAOpenAIClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator", .upToNextMinor(from: "1.0.0-alpha.1")),
        .package(url: "https://github.com/apple/swift-openapi-runtime", .upToNextMinor(from: "1.0.0-alpha.1")),
        .package(url: "https://github.com/apple/swift-openapi-urlsession", .upToNextMinor(from: "1.0.0-alpha.1")),
        .package(url: "https://github.com/apple/swift-http-types", .upToNextMinor(from: "1.0.0")),
        .package(url: "https://github.com/jamesrochabrun/SwiftOpenAI", branch: "main"),
    ],
    targets: [
        .target(
            name: "XCAOpenAIClient",
            dependencies: [
                .product(
                    name: "OpenAPIRuntime",
                    package: "swift-openapi-runtime"
                ),
                .product(
                    name: "OpenAPIURLSession",
                    package: "swift-openapi-urlsession"
                ),
                .product(name: "HTTPTypes", package: "swift-http-types"),
                .product(name: "SwiftOpenAI", package: "SwiftOpenAI")
            ],
            resources: [
                .process("openapi.yaml"),
                .process("openapi-generator-config.yaml")
            ],
            plugins: [
                .plugin(
                    name: "OpenAPIGenerator",
                    package: "swift-openapi-generator"
                )
            ]),
        .testTarget(
            name: "XCAOpenAIClientTests",
            dependencies: ["XCAOpenAIClient"])
    ]
)
