//
//  LiturgyParser.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import SwiftyJSON
import RealmSwift
import LiturgyCommon

struct LiturgyParser {

    func fetchLiturgies(_ json: JSON) -> [DBLiturgy] {
        guard json["version"].exists() else {
            return LiturgyParserV1().fetchLiturgies(json)
        }
        
        guard json["version"].intValue == 2 else {
            return LiturgyParserV1().fetchLiturgies(json)
        }
        
        return LiturgyParserV2().fetchLiturgies(json)
    }

}
