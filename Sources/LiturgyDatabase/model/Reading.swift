//
//  Reading.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation

public struct Reading: Identifiable {
	public let id: UUID
	public let reference: String
	public let title: String?
	public let text: String
    public let observation: String?

    public init(id: UUID, reference: String, title: String?, text: String, observation: String?) {
		self.id = id
		self.reference = reference
		self.title = title
		self.text = text
        self.observation = observation
	}

	public func contains(_ _text: String) -> Bool {
        let __text = _text.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		return id.uuidString.lowercased().contains(__text) ||
		reference.lowercased().contains(__text) ||
		title?.lowercased().contains(__text) ?? false ||
		text.lowercased().contains(__text) ||
        observation?.lowercased().contains(__text) ?? false
	}
}
