//
//  Gospel.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation

public struct Gospel: Identifiable, Sendable {
	public let id: UUID
	public let gospelAcclamation: GospelAcclamation?
	public let reading: Reading?

	public init(id: UUID, gospelAcclamation: GospelAcclamation?, reading: Reading?) {
		self.id = id
		self.gospelAcclamation = gospelAcclamation
		self.reading = reading
	}

	public func contains(_ _text: String) -> Bool {
		return id.uuidString.lowercased().contains(_text) ||
		gospelAcclamation?.contains(_text) ?? false ||
		reading?.contains(_text) ?? false
	}

}
