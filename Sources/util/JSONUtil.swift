//
//  JSONUtil.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation
import SwiftyJSON

struct JSONUtil {

	func parse(data: Data) -> JSON {
		return JSON(data)
	}

}
