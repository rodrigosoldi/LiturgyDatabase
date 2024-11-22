//
//  DBSequence.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 17/11/24.
//

import Foundation
import RealmSwift

public class DBSequence: Object {
    @Persisted(primaryKey: true) public var _id: UUID
    @Persisted public var title: String?
    @Persisted public var text: String
    @Persisted public var observation: String?
}
