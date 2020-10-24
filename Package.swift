// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AnimatedStars",
  platforms: [.iOS("13.0")],
  products: [
    .library(
      name: "AnimatedStars",
      targets: ["AnimatedStars"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "AnimatedStars",
      dependencies: [])
  ]
)
