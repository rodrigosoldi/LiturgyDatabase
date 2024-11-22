//
//  DBReadingType.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 17/11/24.
//

import Foundation
import RealmSwift

public enum DBReadingType: String {
    case firstReading = "firstReading"
    case psalm = "psalm"
    case secondReading = "secondReading"
    case gospel = "gospel"
    case sequence = "sequence"
}
