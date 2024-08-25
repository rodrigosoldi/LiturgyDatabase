//
//  GospelAcclamation.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import RealmSwift

public class GospelAcclamation: Object {
	@Persisted(primaryKey: true) public var _id: UUID
	@Persisted public var chorus: String
	@Persisted public var text: String?
}
