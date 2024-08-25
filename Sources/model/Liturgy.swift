//
//  Liturgy.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import RealmSwift

public class Liturgy: Object {

	@Persisted(primaryKey: true) public var _id: UUID
	@Persisted public var date: String
	@Persisted public var liturgy: String
	@Persisted public var liturgicalColor: String
	@Persisted public var firstReadings: List<Reading>
	@Persisted public var psalms: List<Psalm>
	@Persisted public var secondReadings: List<Reading>
	@Persisted public var gospels: List<Gospel>

}
