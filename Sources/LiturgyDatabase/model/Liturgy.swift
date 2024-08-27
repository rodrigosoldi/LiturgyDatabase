//
//  Liturgy.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation

public struct Liturgy: Identifiable {

	public let id: UUID
	public let date: String
	public let liturgy: String
	public let liturgicalColor: LiturgicalColor
	public let firstReadings: [Reading]
	public let psalms: [Psalm]
	public let secondReadings: [Reading]
	public let gospels: [Gospel]

	public init(id: UUID, date: String, liturgy: String, liturgicalColor: LiturgicalColor, firstReadings: [Reading], psalms: [Psalm], secondReadings: [Reading], gospels: [Gospel]) {
		self.id = id
		self.date = date
		self.liturgy = liturgy
		self.liturgicalColor = liturgicalColor
		self.firstReadings = firstReadings
		self.psalms = psalms
		self.secondReadings = secondReadings
		self.gospels = gospels
	}
}
