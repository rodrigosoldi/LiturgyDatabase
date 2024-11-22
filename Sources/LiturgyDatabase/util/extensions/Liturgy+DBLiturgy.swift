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
        let readings: [ListReading] = liturgy.readings.compactMap({ ListReading($0) })
        self.init(
            id: liturgy._id,
            date: liturgy.date,
            liturgy: liturgy.liturgy,
            liturgicalColor: liturgicalColor,
            observation: liturgy.observation,
            readings: readings)
	}

}
