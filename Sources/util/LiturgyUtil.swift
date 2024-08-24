//
//  LiturgyUtil.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import SwiftyJSON
import RealmSwift

struct LiturgyUtil {

	func fetchLiturgies(_ json: JSON) -> [Liturgy] {
		return json["liturgies"]
			.arrayValue
			.compactMap({ fetchLiturgy($0) })
	}

	func fetchLiturgy(_ json: JSON) -> Liturgy? {
		let date = json["date"].stringValue
		let _liturgy = json["liturgy"].stringValue
		let liturgicalColor = json["liturgicalColor"].stringValue
		let firstReading: Reading? = json["firstReading"].exists() ? fetchReading(json["firstReading"]) : nil
		let psalm: Psalm? = fetchPsalm(json["psalm"])
		let secondReading: Reading? = json["secondReading"].exists() ? fetchReading(json["secondReading"]) : nil
		let gospel: Gospel? = json["gospel"].exists() ? fetchGospel(json["gospel"]) : nil

		let liturgy = Liturgy()
		liturgy._id = UUID()
		liturgy.date = date
		liturgy.liturgy = _liturgy
		liturgy.liturgicalColor = liturgicalColor
		liturgy.firstReading = firstReading
		liturgy.psalm = psalm
		liturgy.secondReading = secondReading
		liturgy.gospel = gospel
		return liturgy
	}

	func fetchReading(_ json: JSON) -> Reading? {
		let reading = Reading()
		reading._id = UUID()
		reading.reference = json["reference"].stringValue
		reading.title = json["title"].string
		reading.intro = json["intro"].string
		reading.verses = fetchVerses(json["verses"].arrayValue)
		return reading
	}

	func fetchPsalm(_ json: JSON) -> Psalm? {
		let psalm = Psalm()
		psalm._id = UUID()
		psalm.reference = json["reference"].stringValue
		psalm.chorus = json["chorus"].stringValue
		psalm.verses = fetchVerses(json["verses"].arrayValue)
		return psalm
	}

	func fetchGospel(_ json: JSON) -> Gospel? {
		let gospel = Gospel()
		gospel._id = UUID()
		gospel.gospelAcclamation = json["gospelAcclamation"].exists() ? fetchGospelAcclamation(json["gospelAcclamation"]) : nil
		gospel.reading = json["reading"].exists() ? fetchReading(json["reading"]) : nil
		return gospel
	}

	func fetchGospelAcclamation(_ json: JSON) -> GospelAcclamation? {
		let gospelAcclamation = GospelAcclamation()
		gospelAcclamation._id = UUID()
		gospelAcclamation.chorus = json["chorus"].stringValue
		gospelAcclamation.verses = fetchVerses(json["verses"].arrayValue)
		return gospelAcclamation
	}

	func fetchVerses(_ versesJSON: [JSON]) -> List<Verse> {
		guard versesJSON.count > 0 else {
			return List()
		}

		let list = List<Verse>()

		for verseJSON in versesJSON {
			guard let verse = fetchVerse(verseJSON) else {
				continue
			}

			list.append(verse)
		}

		return list
	}

	func fetchVerse(_ json: JSON) -> Verse? {
		guard json["text"].exists() else {
			return nil
		}

		let verse = Verse()
		verse._id = UUID()
		verse.reference = json["reference"].string
		verse.text = json["text"].stringValue

		return verse
	}

}
