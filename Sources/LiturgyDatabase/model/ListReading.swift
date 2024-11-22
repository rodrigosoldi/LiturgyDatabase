//
//  ListReading.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 19/11/24.
//

import Foundation

public struct ListReading: Identifiable {
    public let id: UUID
    public let title: String
    public let observation: String?
    public let readings: [ListReadingType]
    
    public init(id: UUID, title: String, observation: String?, readings: [ListReadingType]) {
        self.id = id
        self.title = title
        self.observation = observation
        self.readings = readings
    }
    
    func contains(_ text: String) -> Bool {
        let _text = text.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        return id.uuidString.contains(_text) ||
        title.lowercased().contains(_text) ||
        observation?.lowercased().contains(_text) ?? false ||
        readings.contains(where: { $0.contains(_text) })
    }
}
