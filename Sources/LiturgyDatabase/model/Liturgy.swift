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
    public let observation: String?
    public let readings: [ListReading]
    
    public init(id: UUID, date: String, liturgy: String, liturgicalColor: LiturgicalColor, observation: String?, readings: [ListReading]) {
		self.id = id
		self.date = date
		self.liturgy = liturgy
		self.liturgicalColor = liturgicalColor
        self.observation = observation
        self.readings = readings
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
        readings.contains(where: { $0.contains(text) })
	}

}
