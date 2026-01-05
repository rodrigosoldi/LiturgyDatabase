// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import LiturgyCommon
import SwiftyJSON

struct LiturgyItem: Codable {
	let title: String
	let date: String
	let filename: String

	func toJSON() -> JSON {
		return JSON([
			"title": title,
			"date": date,
			"filename": filename,
		])
	}
}

func manageAddLiturgies(from folder: String, liturgyController: LiturgyControllable, fileManager: FileManager, liturgyItems: inout [LiturgyItem]) throws {
	let paths = try fileManager.contentsOfDirectory(atPath: folder)

	for path in paths {
		var isDirectory: ObjCBool = false
		let folderPath = folder + "/" + path
		if fileManager.fileExists(atPath: folderPath, isDirectory: &isDirectory) {
			if isDirectory.boolValue {
				print("-------- Found a directory: \(path.uppercased()) ----------")
				try manageAddLiturgies(from: folderPath, liturgyController: liturgyController, fileManager: fileManager, liturgyItems: &liturgyItems)
			} else {
				let filePath = folder + "/" + path
				let items = try liturgyController.performAdd(filePath: filePath)
				liturgyItems += items
			}
		} else {
			let filePath = folder + "/" + path
			let items = try liturgyController.performAdd(filePath: filePath)
			liturgyItems += items
		}
	}
}

do {
	let arguments = CommandLine.arguments
	print("Args: \(arguments)")

	let path: String? = arguments.count > 1 ? arguments[1] : nil
	var databaseUtil: DatabaseUtil?
	if let path {
		let fileURL = URL(fileURLWithPath: path)
		databaseUtil = try DatabaseUtil(fileURL: fileURL)
	} else {
		databaseUtil = try DatabaseUtil()
	}

	guard let databaseUtil else {
		print("Unable to create Database Util")
		exit(1)
	}

	let fileManager = FileManager.default
	let jsonUtil = JSONUtil()
	let fileUtil = FileUtil()
	let liturgyParser = LiturgyParser()
	let liturgyController: LiturgyControllable = LiturgyController(
		liturgyParser: liturgyParser,
		fileUtil: fileUtil,
		jsonUtil: jsonUtil,
		databaseUtil: databaseUtil
	)

	let liturgiesFolderPath = try fileUtil.getLiturgiesFolderPath()
	print("will search for files at: \(liturgiesFolderPath)")
	try databaseUtil.deleteAll()

	var liturgyItems = [LiturgyItem]()
	try manageAddLiturgies(from: liturgiesFolderPath, liturgyController: liturgyController, fileManager: fileManager, liturgyItems: &liturgyItems)

	var json = JSON()
	json["sequence_number"].intValue = 1

	let rootPath = FileManager.default.currentDirectoryPath
	let outputPath = rootPath + "/liturgies.json"

	if let lastLiturgiesJSONData = fileUtil.loadLiturgiesData(at: "liturgies.json") {
		let lastLiturgiesJSON = JSON(lastLiturgiesJSONData)
		json["sequence_number"].intValue = lastLiturgiesJSON["sequence_number"].intValue + 1
	}
	json["liturgies"] = JSON(liturgyItems.map { $0.toJSON() })

	if let jsonData = try? JSONEncoder().encode(json),
	   let jsonString = String(data: jsonData, encoding: .utf8)
	{
		try jsonString.write(toFile: outputPath, atomically: true, encoding: .utf8)
		print("Saved liturgies.json at: \(outputPath)")
	}
} catch let error as NSError {
	print("Error creating Realm: \(error.localizedDescription)")
}
