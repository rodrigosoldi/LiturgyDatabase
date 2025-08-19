// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "LiturgyDatabase",
	platforms: [
		.iOS(.v16),
		.macOS(.v13),
	],
	products: [
		.library(
			name: "LiturgyDatabase",
			targets: ["LiturgyDatabase"]
		),
		.executable(
			name: "LiturgyMakeDatabase",
			targets: ["LiturgyMakeDatabase"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.2"),
		.package(url: "https://github.com/rodrigosoldi/LDRealm.git", from: "1.0.1"),
	],
	targets: [
		.target(
			name: "LiturgyDatabase",
			dependencies: [
				"LDRealm",
				"SwiftyJSON",
				"LiturgyCommon",
			],
			path: "Sources/LiturgyDatabase",
			resources: [
				.copy("resources/database.realm"),
			]
		),
		.target(
			name: "LiturgyCommon",
			dependencies: [
				"LDRealm",
				"SwiftyJSON",
			],
			path: "Sources/LiturgyCommon"
		),
		.executableTarget(
			name: "LiturgyMakeDatabase",
			dependencies: [
				"LDRealm",
				"SwiftyJSON",
				"LiturgyCommon",
			],
			path: "Sources/LiturgyMakeDatabase",
			resources: [
				.copy("Liturgies/"),
			]
		),
	]
)
