//
//  Gospel.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation

public struct Gospel: Identifiable {
	public let id: UUID
	public let gospelAcclamation: GospelAcclamation?
	public let reading: Reading?

	public init(id: UUID, gospelAcclamation: GospelAcclamation?, reading: Reading?) {
		self.id = id
		self.gospelAcclamation = gospelAcclamation
		self.reading = reading
	}
}
