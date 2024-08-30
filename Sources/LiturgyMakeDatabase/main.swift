// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import LiturgyCommon

func manageAddLiturgies(from folder: String, liturgyController: LiturgyControllable, fileManager: FileManager) throws {
	let paths = try fileManager.contentsOfDirectory(atPath: folder)

	for path in paths {
		var isDirectory: ObjCBool = false
		let folderPath = folder + "/" + path
		if fileManager.fileExists(atPath: folderPath, isDirectory: &isDirectory) {
			if isDirectory.boolValue {
				print("-------- Found a Directory: \(path.uppercased()) ----------")
				try manageAddLiturgies(from: folderPath, liturgyController: liturgyController, fileManager: fileManager)
			} else {
				let filePath = folder + "/" + path
				try liturgyController.performAdd(filePath: filePath)
			}
		} else {
			let filePath = folder + "/" + path
			try liturgyController.performAdd(filePath: filePath)
		}
	}
}

do {
	let arguments = CommandLine.arguments
	print("Args: \(arguments)")

	let path: String? = arguments.count > 1 ? arguments[1] : nil
	var databaseUtil: DatabaseUtil?
	if let path {
		let fileURL: URL = URL(fileURLWithPath: path)
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
		databaseUtil: databaseUtil)

	let liturgiesFolderPath = try fileUtil.getLiturgiesFolderPath()
	print("will search for files at: \(liturgiesFolderPath)")
	try manageAddLiturgies(from: liturgiesFolderPath, liturgyController: liturgyController, fileManager: fileManager)
} catch let error as NSError {
	print("Error creating Realm: \(error.localizedDescription)")
}
