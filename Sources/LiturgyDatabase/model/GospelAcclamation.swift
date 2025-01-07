//
//  GospelAcclamation.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation

public struct GospelAcclamation: Identifiable, Sendable {
	public let id: UUID
	public let chorus: String
	public let text: String?

	public init(id: UUID, chorus: String, text: String?) {
		self.id = id
		self.chorus = chorus
		self.text = text
	}

	public func contains(_ _text: String) -> Bool {
		return id.uuidString.lowercased().contains(_text) ||
		chorus.lowercased().contains(_text) ||
		text?.lowercased().contains(_text) ?? false
	}
}
