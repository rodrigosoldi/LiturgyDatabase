//
//  ListReading+DBListReading.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 19/11/24.
//

import LiturgyCommon

extension ListReading {
    
    init(_ listReading: DBListReading) {
        var readings: [ListReadingType] = []
        
        if listReading.type == "reading" {
            readings = listReading.readings.compactMap({ ListReadingType($0) })
        } else if listReading.type == "psalm" {
            readings = listReading.psalms.compactMap({ ListReadingType($0) })
        } else if listReading.type == "gospel" {
            readings = listReading.gospels.compactMap({ ListReadingType($0) })
        } else if listReading.type == "sequence" {
            readings = listReading.sequences.compactMap({ ListReadingType($0) })
        }
        
        self.init(
            id: listReading._id,
            title: listReading.title,
            observation: listReading.observation,
            readings: readings)
    }
    
}
