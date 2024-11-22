//
//  ListReading.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 19/11/24.
//

import Foundation

public struct ListReading: Identifiable {
    public let id: UUID
    public let type: String
    public let title: String
    public let observation: String?
    public let readings: [ListReadingType]
    
    func contains(_ text: String) -> Bool {
        let _text = text.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        return id.uuidString.contains(_text) ||
        type.contains(_text) ||
        observation?.contains(_text) ?? false ||
        readings.contains(where: { $0.contains(_text) })
    }
}
