//
//  Sequence.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 19/11/24.
//

import Foundation

public struct Sequence: Identifiable {
    public let id: UUID
    public let title: String?
    public let text: String
    public let observation: String?
    
    init(id: UUID, title: String?, text: String, observation: String?) {
        self.id = id
        self.title = title
        self.text = text
        self.observation = observation
    }
    
    func contains(_ text: String) -> Bool {
        let _text = text.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        return id.uuidString.contains(_text) ||
        title?.contains(_text) ?? false ||
        text.contains(_text) ||
        observation?.contains(_text) ?? false
    }
}
