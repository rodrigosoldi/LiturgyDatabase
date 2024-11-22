//
//  Psalm.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation

public struct Psalm: Identifiable {
	public let id: UUID
	public let reference: String
	public let chorus: String
	public let verses: [String]

	public init(id: UUID, reference: String, chorus: String, verses: [String]) {
		self.id = id
		self.reference = reference
		self.chorus = chorus
		self.verses = verses
	}

	public func contains(_ _text: String) -> Bool {
        let __text = _text.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		return id.uuidString.lowercased().contains(__text) ||
		reference.lowercased().contains(__text) ||
		chorus.lowercased().contains(__text) ||
		verses.contains(where: { $0.lowercased().contains(__text) })
	}

}

extension Psalm {

	public var text: String {
        verses.joined(separator: "\n\n")
	}

}
