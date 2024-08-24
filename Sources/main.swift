// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

do {
	let databaseUtil = try DatabaseUtil()
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
			print("Data: \(liturgy.date) - \(liturgy.liturgy)")
			try databaseUtil.save(liturgy: liturgy)
		}
	}

} catch let error as NSError {
	print("Error creating Realm: \(error.localizedDescription)")
}
