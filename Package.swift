// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LiturgyMakeRealmDatabase",
	dependencies: [
		.package(url: "https://github.com/realm/realm-swift.git", from: "10.0.0"),
		.package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.2")
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "LiturgyMakeRealmDatabase",
			dependencies: [
				.product(name: "RealmSwift", package: "realm-swift"),
				"SwiftyJSON"
			],
			resources: [
				.copy("Liturgies/")
			]
		),
    ]
)
