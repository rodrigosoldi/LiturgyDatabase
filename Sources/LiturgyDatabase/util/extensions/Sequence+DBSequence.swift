//
//  Sequence+DBSequence.swift
//  LiturgyDatabase
//
//  Created by Rodrigo Soldi on 19/11/24.
//

import LiturgyCommon

extension Sequence {
    
    init(_ sequence: DBSequence) {
        self.init(
            id: sequence._id,
            title: sequence.title,
            text: sequence.text,
            observation: sequence.observation)
    }
    
}
