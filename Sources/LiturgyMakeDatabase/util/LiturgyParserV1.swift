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

struct LiturgyParserV1 {

    func fetchLiturgies(_ json: JSON) -> [DBLiturgy] {
        return json["liturgies"]
            .arrayValue
            .compactMap({ fetchLiturgy($0) })
    }

    private func fetchLiturgy(_ json: JSON) -> DBLiturgy? {
        let date = json["date"].stringValue
        let _liturgy = json["liturgy"].stringValue
        let liturgicalColor = json["liturgicalColor"].stringValue

        let liturgy = DBLiturgy()
        liturgy._id = UUID()
        liturgy.date = date
        liturgy.liturgy = _liturgy
        liturgy.liturgicalColor = liturgicalColor

        let listReadings = List<DBListReading>()
        
        let firstReadings: List<DBReading> = fetchReadings(json["firstReadings"].arrayValue)
        if !firstReadings.isEmpty {
            let listReading = DBListReading()
            listReading._id = UUID()
            listReading.type = "reading"
            listReading.title = "1ª Leitura"
            listReading.readings = firstReadings
            
            listReadings.append(listReading)
        }
        
        let psalms: List<DBPsalm> = fetchPsalms(json["psalms"].arrayValue)
        if !psalms.isEmpty {
            let listReading = DBListReading()
            listReading._id = UUID()
            listReading.type = "psalm"
            listReading.title = "Salmo"
            listReading.psalms = psalms
            
            listReadings.append(listReading)
        }
        
        let secondReadings: List<DBReading> = fetchReadings(json["secondReadings"].arrayValue)
        if !secondReadings.isEmpty {
            let listReading = DBListReading()
            listReading._id = UUID()
            listReading.type = "reading"
            listReading.title = "2ª Leitura"
            listReading.readings = secondReadings
            
            listReadings.append(listReading)
        }
        
        let gospels: List<DBGospel> = fetchGospels(json["gospels"].arrayValue)
        if !gospels.isEmpty {
            let listReading = DBListReading()
            listReading._id = UUID()
            listReading.type = "gospel"
            listReading.title = "Evangelho"
            listReading.gospels = gospels
            
            listReadings.append(listReading)
        }
        
        liturgy.readings = listReadings
        return liturgy
    }

    private func fetchReadings(_ jsonArray: [JSON]) -> List<DBReading> {
        guard jsonArray.count > 0 else {
            return List()
        }

        let list = List<DBReading>()

        for json in jsonArray {
            let reading = fetchReading(json)
            list.append(reading)
        }

        return list
    }

    private func fetchReading(_ json: JSON) -> DBReading {
        let reading = DBReading()
        reading._id = UUID()
        reading.reference = json["reference"].stringValue
        reading.title = json["title"].string
        reading.text = json["text"].stringValue
        return reading
    }

    private func fetchPsalms(_ jsonArray: [JSON]) -> List<DBPsalm> {
        guard jsonArray.count > 0 else {
            return List()
        }

        let list = List<DBPsalm>()

        for json in jsonArray {
            let psalm = fetchPsalm(json)
            list.append(psalm)
        }

        return list
    }

    private func fetchPsalm(_ json: JSON) -> DBPsalm {
        let psalm = DBPsalm()
        psalm._id = UUID()
        psalm.reference = json["reference"].stringValue
        psalm.chorus = json["chorus"].stringValue
        psalm.verses = fetchPSalmTexts(json["texts"].arrayValue)
        return psalm
    }

    private func fetchGospels(_ jsonArray: [JSON]) -> List<DBGospel> {
        guard jsonArray.count > 0 else {
            return List()
        }

        let list = List<DBGospel>()

        for json in jsonArray {
            let gospel = fetchGospel(json)
            list.append(gospel)
        }

        return list
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

}
