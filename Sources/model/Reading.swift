//
//  Reading.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import RealmSwift

public class Reading: Object {
	@Persisted(primaryKey: true) public var _id: UUID
	@Persisted public var reference: String
	@Persisted public var title: String?
	@Persisted public var intro: String?
	@Persisted public var verses: List<Verse>
}
