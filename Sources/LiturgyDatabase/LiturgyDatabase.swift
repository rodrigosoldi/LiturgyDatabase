//
//  LiturgyDatabase.swift
//  
//
//  Created by Rodrigo Soldi on 25/08/24.
//

import Foundation
import RealmSwift
import LiturgyCommon

public protocol LiturgyDatabase {
	func fetchAll() async throws -> [Liturgy]
	func fetchAll(filter: String) async throws -> [Liturgy]
	func fetchLiturgy(byDate date: String) async throws -> Liturgy?
}

public class LiturgyDatabaseImpl: LiturgyDatabase {


	private let fileUtil: FileUtil
	private let queue: DispatchQueue = DispatchQueue(label: "com.soldi.LiturgyDatabase.databaseQueue")
	private let realm: Realm

	public convenience init() throws {
		try self.init(fileUtil: FileUtilImpl())
	}

	init(fileUtil: FileUtil) throws {
		self.fileUtil = fileUtil
		let fileURL = try fileUtil.databasePath()
		let configuration = Realm.Configuration(fileURL: fileURL, readOnly: true)
		self.realm = try Realm(configuration: configuration)
	}

	public func fetchAll() async throws -> [Liturgy] {
		return try await _fetchAll()
	}

	public func fetchAll(filter: String) async throws -> [Liturgy] {
		return try await _fetchAll(filter: filter)
	}

	public func fetchLiturgy(byDate date: String) async throws -> Liturgy? {
		return try await _fetchAll(filter: "date contains \"\(date)\"").first
	}

	private func _fetchAll(filter: String? = nil) async throws -> [Liturgy] {
		try await withCheckedThrowingContinuation { continuation in
			queue.async {
				var liturgies: [Liturgy] = []
				
				if let filter {
					let dbLiturgies = Array(self.realm.objects(DBLiturgy.self).filter(filter))
					liturgies = dbLiturgies.compactMap({ Liturgy($0) })
				} else {
					let dbLiturgies = Array(self.realm.objects(DBLiturgy.self))
					liturgies = dbLiturgies.compactMap({ Liturgy($0) })
				}

				continuation.resume(returning: liturgies)
			}
		}
	}

}
