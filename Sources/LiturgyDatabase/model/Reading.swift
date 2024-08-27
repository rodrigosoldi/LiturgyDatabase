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
}
