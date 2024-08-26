//
//  Liturgy.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation

public struct Liturgy {
	public let _id: UUID
	public let date: String
	public let liturgy: String
	public let liturgicalColor: LiturgicalColor
	public let firstReadings: [Reading]
	public let psalms: [Psalm]
	public let secondReadings: [Reading]
	public let gospels: [Gospel]
}
