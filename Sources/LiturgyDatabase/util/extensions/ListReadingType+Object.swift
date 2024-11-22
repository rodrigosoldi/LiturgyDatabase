//
//  ListReadingType+Object.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 19/11/24.
//

import LiturgyCommon
import RealmSwift

extension ListReadingType {
    
    init?(_ object: Object) {
        switch object {
        case let reading as DBReading:
            self = .reading(Reading(reading))
        case let psalm as DBPsalm:
            self = .psalm(Psalm(psalm))
        case let gospel as DBGospel:
            self = .gospel(Gospel(gospel))
        case let sequence as DBSequence:
            self = .sequence(Sequence(sequence))
        default:
            return nil
        }
    }

}
