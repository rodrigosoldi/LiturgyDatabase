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
	public let texts: [String]

	public init(id: UUID, reference: String, chorus: String, texts: [String]) {
		self.id = id
		self.reference = reference
		self.chorus = chorus
		self.texts = texts
	}

	public func contains(_ _text: String) -> Bool {
		return id.uuidString.lowercased().contains(_text) ||
		reference.lowercased().contains(_text) ||
		chorus.lowercased().contains(_text) ||
		texts.contains(where: { $0.lowercased().contains(_text) })
	}

}

extension Psalm {

	public var text: String {
		texts.joined(separator: "\n\n")
	}

}
