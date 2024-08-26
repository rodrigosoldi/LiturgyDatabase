//
//  DBGospel.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import RealmSwift

public class DBGospel: Object {
	@Persisted(primaryKey: true) public var _id: UUID
	@Persisted public var gospelAcclamation: DBGospelAcclamation?
	@Persisted public var reading: DBReading?
}
