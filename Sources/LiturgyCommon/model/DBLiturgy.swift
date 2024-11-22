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
    
    /// key: date
	@Persisted public var date: String
    
    /// key: liturgy
	@Persisted public var liturgy: String
    
    /// key: liturgicalColor
	@Persisted public var liturgicalColor: String
    
    /// key: obs
    @Persisted public var observation: String?
    
    /// key: readings
    @Persisted public var readings: List<DBListReading>

}
