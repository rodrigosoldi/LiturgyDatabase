//
//  Gospel+DBGospel.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation
import LiturgyCommon

extension Gospel {

	init(_ gospel: DBGospel) {
		self.init(
			id: gospel._id,
			gospelAcclamation: GospelAcclamation(gospel.gospelAcclamation),
            reading: gospel.reading != nil ? Reading(gospel.reading!) : nil)
	}

}
