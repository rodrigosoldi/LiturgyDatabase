//
//  LiturgyUtil.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import SwiftyJSON
import RealmSwift
import LiturgyCommon

struct LiturgyUtil {

	func fetchLiturgies(_ json: JSON) -> [DBLiturgy] {
		return json["liturgies"]
			.arrayValue
			.compactMap({ fetchLiturgy($0) })
	}

	func fetchLiturgy(_ json: JSON) -> DBLiturgy? {
		let date = json["date"].stringValue
		let _liturgy = json["liturgy"].stringValue
		let liturgicalColor = json["liturgicalColor"].stringValue
		let firstReadings: List<DBReading> = fetchReadings(json["firstReadings"].arrayValue)
		let psalms: List<DBPsalm> = fetchPsalms(json["psalms"].arrayValue)
		let secondReadings: List<DBReading> = fetchReadings(json["secondReadings"].arrayValue)
		let gospels: List<DBGospel> = fetchGospels(json["gospels"].arrayValue)

		let liturgy = DBLiturgy()
		liturgy._id = UUID()
		liturgy.date = date
		liturgy.liturgy = _liturgy
		liturgy.liturgicalColor = liturgicalColor
		liturgy.firstReadings = firstReadings
		liturgy.psalms = psalms
		liturgy.secondReadings = secondReadings
		liturgy.gospels = gospels
		return liturgy
	}

	func fetchReadings(_ jsonArray: [JSON]) -> List<DBReading> {
		guard jsonArray.count > 0 else {
			return List()
		}

		let list = List<DBReading>()

		for json in jsonArray {
			guard let reading = fetchReading(json) else {
				continue
			}

			list.append(reading)
		}

		return list
	}

	func fetchReading(_ json: JSON) -> DBReading? {
		let reading = DBReading()
		reading._id = UUID()
		reading.reference = json["reference"].stringValue
		reading.title = json["title"].string
		reading.text = json["text"].stringValue
		return reading
	}

	func fetchPsalms(_ jsonArray: [JSON]) -> List<DBPsalm> {
		guard jsonArray.count > 0 else {
			return List()
		}

		let list = List<DBPsalm>()

		for json in jsonArray {
			guard let psalm = fetchPsalm(json) else {
				continue
			}

			list.append(psalm)
		}

		return list
	}

	func fetchPsalm(_ json: JSON) -> DBPsalm? {
		let psalm = DBPsalm()
		psalm._id = UUID()
		psalm.reference = json["reference"].stringValue
		psalm.chorus = json["chorus"].stringValue
		psalm.texts = fetchPSalmTexts(json["texts"].arrayValue)
		return psalm
	}

	func fetchGospels(_ jsonArray: [JSON]) -> List<DBGospel> {
		guard jsonArray.count > 0 else {
			return List()
		}

		let list = List<DBGospel>()

		for json in jsonArray {
			guard let gospel = fetchGospel(json) else {
				continue
			}

			list.append(gospel)
		}

		return list
	}

	func fetchGospel(_ json: JSON) -> DBGospel? {
		let gospel = DBGospel()
		gospel._id = UUID()
		gospel.gospelAcclamation = json["gospelAcclamation"].exists() ? fetchGospelAcclamation(json["gospelAcclamation"]) : nil
		gospel.reading = json["reading"].exists() ? fetchReading(json["reading"]) : nil
		return gospel
	}

	func fetchGospelAcclamation(_ json: JSON) -> DBGospelAcclamation? {
		let gospelAcclamation = DBGospelAcclamation()
		gospelAcclamation._id = UUID()
		gospelAcclamation.chorus = json["chorus"].stringValue
		gospelAcclamation.text = json["text"].string
		return gospelAcclamation
	}

	func fetchPSalmTexts(_ textsJSON: [JSON]) -> List<String> {
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
