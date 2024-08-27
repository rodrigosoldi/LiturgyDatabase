//
//  Liturgy+DBLiturgy.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation
import LiturgyCommon

extension Liturgy {

	init(_ liturgy: DBLiturgy) {
		let liturgicalColor = LiturgicalColor(rawValue: liturgy.liturgicalColor) ?? .green

		let dbFirstReadings = Array(liturgy.firstReadings)
		let firstReadings = dbFirstReadings.compactMap({ Reading($0) })

		let dbPsalms = Array(liturgy.psalms)
		let psalms = dbPsalms.compactMap({ Psalm($0) })

		let dbSecondReadings = Array(liturgy.secondReadings)
		let secondReadings = dbSecondReadings.compactMap({ Reading($0) })

		let dbGospels = Array(liturgy.gospels)
		let gospels = dbGospels.compactMap({ Gospel($0) })

		self.init(
			id: liturgy._id,
			date: liturgy.date,
			liturgy: liturgy.liturgy,
			liturgicalColor: liturgicalColor,
			firstReadings: firstReadings,
			psalms: psalms,
			secondReadings: secondReadings,
			gospels: gospels)
	}

}
