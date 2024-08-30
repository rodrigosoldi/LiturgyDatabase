//
//  LiturgyController.swift
//
//
//  Created by Rodrigo Soldi on 30/08/24.
//

import Foundation

protocol LiturgyControllable {
	func performAdd(filePath: String) throws
}

struct LiturgyController: LiturgyControllable {

	private let liturgyParser: LiturgyParser
	private let fileUtil: FileUtil
	private let jsonUtil: JSONUtil
	private let databaseUtil: DatabaseUtil

	init(liturgyParser: LiturgyParser, fileUtil: FileUtil, jsonUtil: JSONUtil, databaseUtil: DatabaseUtil) {
		self.liturgyParser = liturgyParser
		self.fileUtil = fileUtil
		self.jsonUtil = jsonUtil
		self.databaseUtil = databaseUtil		
	}

	func performAdd(filePath: String) throws {

		guard let jsonData = fileUtil.loadLiturgiesData(at: filePath) else {
			return
		}

		let json = jsonUtil.parse(data: jsonData)
		let liturgies = liturgyParser.fetchLiturgies(json)

		for liturgy in liturgies {
			// Salvando o objeto no Realm
			print("\(liturgy.date) - \(liturgy.liturgy)")
			try databaseUtil.save(liturgy: liturgy)
		}
	}

}
