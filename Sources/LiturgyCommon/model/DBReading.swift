//
//  DBReading.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import RealmSwift

public class DBReading: Object {
    
	@Persisted(primaryKey: true) public var _id: UUID
    
    /// key: reference
	@Persisted public var reference: String
    
    /// key: title
	@Persisted public var title: String?
    
    /// key: text
    @Persisted public var text: String
    
    /// key: obs
	@Persisted public var observation: String?
    
    
}
