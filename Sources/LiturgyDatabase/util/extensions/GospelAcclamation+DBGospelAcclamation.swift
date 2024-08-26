//
//  GospelAcclamation+DBGospelAcclamation.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation
import LiturgyCommon

extension GospelAcclamation {

	init?(_ gospelAcclamation: DBGospelAcclamation?) {
		guard let gospelAcclamation else {
			return nil
		}
		
		self.init(
			_id: gospelAcclamation._id,
			chorus: gospelAcclamation.chorus,
			text: gospelAcclamation.text)
	}

}
