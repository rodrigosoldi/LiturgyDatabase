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

	public init(id: UUID, reference: String, title: String?, text: String) {
		self.id = id
		self.reference = reference
		self.title = title
		self.text = text
	}

	public func contains(_ _text: String) -> Bool {
		return id.uuidString.lowercased().contains(_text) ||
		reference.lowercased().contains(_text) ||
		title?.lowercased().contains(_text) ?? false ||
		text.lowercased().contains(_text)
	}
}
