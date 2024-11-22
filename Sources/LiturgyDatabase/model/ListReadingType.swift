//
//  ListReadingType.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 19/11/24.
//

import Foundation

public enum ListReadingType: Identifiable {
    case reading(Reading)
    case psalm(Psalm)
    case gospel(Gospel)
    case sequence(Sequence)
    
    public var id: UUID {
        switch self {
        case .reading(let reading):
            return reading.id
        case .psalm(let psalm):
            return psalm.id
        case .gospel(let gospel):
            return gospel.id
        case .sequence(let sequence):
            return sequence.id
        }
    }
    
    func contains(_ text: String) -> Bool {
        let _text = text.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        switch self {
        case .reading(let reading):
            return reading.contains(_text)
        case .psalm(let psalm):
            return psalm.contains(_text)
        case .gospel(let gospel):
            return gospel.contains(_text)
        case .sequence(let sequence):
            return sequence.contains(_text)
        }
    }
}
