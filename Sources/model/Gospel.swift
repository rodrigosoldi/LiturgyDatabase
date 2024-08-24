//
//  Gospel.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import RealmSwift

public class Gospel: Object {
	@Persisted(primaryKey: true) public var _id: UUID
	@Persisted public var gospelAcclamation: GospelAcclamation?
	@Persisted public var reading: Reading?
}
