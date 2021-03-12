// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Segment-Appboy",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v12)
  ],
  products: [
    .library(name: "Full-SDK", targets: ["Full-SDK"]),
    .library(name: "Core", targets: ["Core"])
  ],
  dependencies: [
    .package(name: "Segment", url: "https://github.com/segmentio/analytics-ios.git", from: "4.1.1"),
    .package(name: "Appboy_iOS_SDK", url: "https://github.com/braze-inc/braze-ios-sdk.git", from: "4.0.0"),
  ],
  targets: [
    .target(
      name: "Full-SDK",
      dependencies: [
          .product(name: "Segment", package: "Segment"),
          .product(name: "AppboyUI", package: "Appboy_iOS_SDK"),
      ],
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath(".")
      ]
    ),
    .target(
      name: "Core",
      dependencies: [
          .product(name: "Segment", package: "Segment"),
          .product(name: "AppboyKit", package: "Appboy_iOS_SDK"),
      ],
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath(".")
      ]
    )
  ]
)
