//
//  GospelAcclamation.swift
//
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import Foundation

public struct GospelAcclamation: Identifiable {
	public let id: UUID
	public let chorus: String
	public let text: String?

	public init(id: UUID, chorus: String, text: String?) {
		self.id = id
		self.chorus = chorus
		self.text = text
	}
}
