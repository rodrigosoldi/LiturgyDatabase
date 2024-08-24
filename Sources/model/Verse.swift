//
//  Verse.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import RealmSwift

public class Verse: Object {
	@Persisted(primaryKey: true) public var _id: UUID
	@Persisted public var reference: String?
	@Persisted public var text: String
}