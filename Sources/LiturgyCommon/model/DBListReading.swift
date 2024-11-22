//
//  DBListReading.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 17/11/24.
//

import Foundation
import RealmSwift

public class DBListReading: Object {
    
    @Persisted(primaryKey: true) public var _id: UUID
    
    /// key: type
    @Persisted public var type: String
    
    /// key: title
    @Persisted public var title: String
    
    /// key: obs
    @Persisted public var observation: String?
    
    /// key: readings
    @Persisted public var readings: List<DBReading>
    @Persisted public var psalms: List<DBPsalm>
    @Persisted public var gospels: List<DBGospel>
    @Persisted public var sequences: List<DBSequence>
    
}
