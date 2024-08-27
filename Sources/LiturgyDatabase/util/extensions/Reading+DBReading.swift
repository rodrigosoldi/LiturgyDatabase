//
//  Reading+DBReading.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation
import LiturgyCommon

extension Reading {

	init?(_ reading: DBReading?) {
		guard let reading else {
			return nil
		}
		
		self.init(
			id: reading._id,
			reference: reading.reference,
			title: reading.title,
			text: reading.text)
	}

}
