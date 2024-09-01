//
//  Liturgy.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation

public struct Liturgy: Identifiable, Equatable {

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

	public static func ==(lhs: Liturgy, rhs: Liturgy) -> Bool {
		return lhs.id == rhs.id
	}

	public func contains(_ _text: String?) -> Bool {
		guard let _text else {
			return false
		}

		guard !_text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
			return false
		}

		let text = _text.lowercased()

		return id.uuidString.lowercased().contains(text) ||
		date.lowercased().contains(text) ||
		liturgy.lowercased().contains(text) ||
		liturgicalColor.rawValue.lowercased().contains(text) ||
		firstReadings.contains(where: { $0.contains(text) }) ||
		psalms.contains(where: { $0.contains(text) }) ||
		secondReadings.contains(where: { $0.contains(text) })

	}

}
