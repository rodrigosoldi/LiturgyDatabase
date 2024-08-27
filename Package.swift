// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LiturgyDatabase",
	platforms: [
		.iOS(.v16),
		.macOS(.v10_15)
	],
	products: [
		.library(
			name: "LiturgyDatabase",
			targets: ["LiturgyDatabase"]
		),
		.executable(
			name: "LiturgyMakeDatabase",
			targets: ["LiturgyMakeDatabase"]
		)
	],
	dependencies: [
		.package(url: "https://github.com/realm/realm-swift.git", from: "10.0.0"),
		.package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.2")		
	],
    targets: [
		.target(
			name: "LiturgyDatabase",
			dependencies: [
				.product(name: "RealmSwift", package: "realm-swift"),
				"SwiftyJSON",
				"LiturgyCommon"
			],
			path: "Sources/LiturgyDatabase",
			resources: [
 				.copy("resources/database.realm")
			]
		),
		.target(
			name: "LiturgyCommon",
			dependencies: [
				.product(name: "RealmSwift", package: "realm-swift"),
				"SwiftyJSON"
			],
			path: "Sources/LiturgyCommon"
		),
        .executableTarget(
            name: "LiturgyMakeDatabase",
			dependencies: [
				.product(name: "RealmSwift", package: "realm-swift"),
				"SwiftyJSON",
				"LiturgyCommon"
			],
			path: "Sources/LiturgyMakeDatabase",
			resources: [
				.copy("Liturgies/")
			]
		)
    ]
)
