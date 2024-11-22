//
//  LiturgyParserV1.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 17/11/24.
//

import Foundation
import SwiftyJSON
import RealmSwift
import LiturgyCommon

struct LiturgyParserV2 {

    func fetchLiturgies(_ json: JSON) -> [DBLiturgy] {
        return json["liturgies"]
            .arrayValue
            .compactMap({ fetchLiturgy($0) })
    }

    private func fetchLiturgy(_ json: JSON) -> DBLiturgy? {
        let date = json["date"].stringValue
        let _liturgy = json["liturgy"].stringValue
        let liturgicalColor = json["liturgicalColor"].stringValue
        let observation = json["observation"].string
        let readings: List<DBListReading> = fetchListReadings(json["readings"].arrayValue)

        let liturgy = DBLiturgy()
        liturgy._id = UUID()
        liturgy.date = date
        liturgy.liturgy = _liturgy
        liturgy.liturgicalColor = liturgicalColor
        liturgy.observation = observation
        liturgy.readings = readings
        
        return liturgy
    }
    
    private func fetchListReadings(_ jsonArray: [JSON]) -> List<DBListReading> {
        let list = List<DBListReading>()

        for json in jsonArray {
            let type: String = json["type"].stringValue
            let title: String = json["title"].stringValue
            let observation: String? = json["obs"].string
            
            var listReading = DBListReading()
            listReading.type = type
            listReading.title = title
            listReading.observation = observation            
            fetchReadings(json["readings"].arrayValue, type: type, listReading: &listReading)
            list.append(listReading)
        }
        
        return list
    }

    private func fetchReadings(_ jsonArray: [JSON], type: String, listReading: inout DBListReading) {
        guard jsonArray.count > 0 else {
            return
        }
        
        if type == "reading" {
            let list = List<DBReading>()
            for json in jsonArray {
                let reading = fetchReading(json)
                list.append(reading)
            }
            listReading.readings = list
        } else if type == "psalm" {
            let list = List<DBPsalm>()
            for json in jsonArray {
                let reading = fetchPsalm(json)
                list.append(reading)
            }
            listReading.psalms = list
        } else if type == "gospel" {
            let list = List<DBGospel>()
            for json in jsonArray {
                let reading = fetchGospel(json)
                list.append(reading)
            }
            listReading.gospels = list
        } else if type == "sequence" {
            let list = List<DBSequence>()
            for json in jsonArray {
                let reading = fetchSequence(json)
                list.append(reading)
            }
            listReading.sequences = list
        }
    }
    
    private func fetchReading(_ json: JSON) -> DBReading {
        let reading = DBReading()
        reading._id = UUID()
        reading.reference = json["reference"].stringValue
        reading.title = json["title"].string
        reading.text = json["text"].stringValue
        reading.observation = json["obs"].string
        return reading
    }

    private func fetchPsalm(_ json: JSON) -> DBPsalm {
        let psalm = DBPsalm()
        psalm._id = UUID()
        psalm.reference = json["reference"].stringValue
        psalm.chorus = json["chorus"].stringValue
        psalm.verses = fetchPSalmTexts(json["verses"].arrayValue)
        psalm.observation = json["obs"].string
        return psalm
    }

    private func fetchGospel(_ json: JSON) -> DBGospel {
        let gospel = DBGospel()
        gospel._id = UUID()
        gospel.gospelAcclamation = fetchGospelAcclamation(json["gospelAcclamation"])
        gospel.reading = fetchReading(json["reading"])
        return gospel
    }

    private func fetchGospelAcclamation(_ json: JSON) -> DBGospelAcclamation {
        let gospelAcclamation = DBGospelAcclamation()
        gospelAcclamation._id = UUID()
        gospelAcclamation.chorus = json["chorus"].stringValue
        gospelAcclamation.text = json["text"].string
        return gospelAcclamation
    }

    private func fetchPSalmTexts(_ textsJSON: [JSON]) -> List<String> {
        guard textsJSON.count > 0 else {
            return List()
        }

        let list = List<String>()

        for textJSON in textsJSON {
            guard let text = textJSON.string else {
                continue
            }

            list.append(text)
        }

        return list
    }
    
    private func fetchSequence(_ json: JSON) -> DBSequence {
        let sequence = DBSequence()
        sequence._id = UUID()
        sequence.observation = json["obs"].string
        sequence.title = json["title"].string
        sequence.text = json["text"].stringValue
        return sequence
    }
    

}
