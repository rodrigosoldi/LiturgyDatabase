// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import LiturgyCommon

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

	let jsonUtil = JSONUtil()
	let fileUtil = FileUtil()
	let liturgyUtil = LiturgyUtil()

	let folderPath = fileUtil.getLiturgiesFolderPath()
	let files = fileUtil.getLiturgiesFiles(basePath: folderPath)

	for file in files {
		let filePath = folderPath + "/" + file
		guard let jsonData = fileUtil.loadLiturgiesData(at: filePath) else {
			continue
		}

		let json = jsonUtil.parse(data: jsonData)
		let liturgies = liturgyUtil.fetchLiturgies(json)

		for liturgy in liturgies {
			// Salvando o objeto no Realm
			print("\(liturgy.date) - \(liturgy.liturgy)")
			try databaseUtil.save(liturgy: liturgy)
		}
	}

} catch let error as NSError {
	print("Error creating Realm: \(error.localizedDescription)")
}
