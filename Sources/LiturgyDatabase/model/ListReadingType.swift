//
//  ListReadingType.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 19/11/24.
//

public enum ListReadingType {
    case reading(Reading)
    case psalm(Psalm)
    case gospel(Gospel)
    case sequence(Sequence)
    
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
