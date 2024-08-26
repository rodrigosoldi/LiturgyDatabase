//
//  DBLiturgy.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import RealmSwift

public class DBLiturgy: Object {

	@Persisted(primaryKey: true) public var _id: UUID
	@Persisted public var date: String
	@Persisted public var liturgy: String
	@Persisted public var liturgicalColor: String
	@Persisted public var firstReadings: List<DBReading>
	@Persisted public var psalms: List<DBPsalm>
	@Persisted public var secondReadings: List<DBReading>
	@Persisted public var gospels: List<DBGospel>

}
