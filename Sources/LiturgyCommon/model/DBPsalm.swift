//
//  Psalm.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import RealmSwift

public class DBPsalm: Object {
	@Persisted(primaryKey: true) public var _id: UUID
    @Persisted public var observation: String?
	@Persisted public var reference: String
	@Persisted public var chorus: String
	@Persisted public var verses: List<String>
}
