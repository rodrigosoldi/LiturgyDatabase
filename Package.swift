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
	],
	targets: [
		.target(
			name: "LiturgyDatabase",
			dependencies: [
				"RealmSwift",
				"Realm",
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
				"RealmSwift",
				"Realm",
				"SwiftyJSON",
			],
			path: "Sources/LiturgyCommon"
		),
		.executableTarget(
			name: "LiturgyMakeDatabase",
			dependencies: [
				"RealmSwift",
				"Realm",
				"SwiftyJSON",
				"LiturgyCommon",
			],
			path: "Sources/LiturgyMakeDatabase",
			resources: [
				.copy("Liturgies/"),
			]
		),
		.binaryTarget(name: "RealmSwift", path: "Resources/RealmSwift.xcframework"),
		.binaryTarget(name: "Realm", path: "Resources/Realm.xcframework"),
	]
)
