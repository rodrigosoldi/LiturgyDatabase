//
//  Psalm+DBPsalm.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation
import LiturgyCommon

extension Psalm {

	init(_ psalm: DBPsalm) {
		let texts = Array(psalm.texts)
		self.init(
			id: psalm._id,
			reference: psalm.reference,
			chorus: psalm.chorus,
			texts: texts)
	}

}
