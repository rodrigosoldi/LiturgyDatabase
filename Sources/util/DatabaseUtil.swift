//
//  DatabaseUtil.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import RealmSwift

struct DatabaseUtil {

	private let realm: Realm

	init(fileURL: URL? = nil) throws {
		if let fileURL {
			let configuration = Realm.Configuration(fileURL: fileURL)
			self.realm = try Realm(configuration: configuration)
		} else {
			self.realm = try Realm()
		}

		// Printando o local onde o arquivo Realm foi criado
		print("Realm file created at: \(self.realm.configuration.fileURL!.path)")
	}

	func save(liturgy: Liturgy) throws {
		try realm.write {
			realm.add(liturgy)
		}
	}

}
