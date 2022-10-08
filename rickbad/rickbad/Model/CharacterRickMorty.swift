//
//  CharacterRickMorty.swift
//  rickbad
//
//  Created by Valeria Fuster on 02/10/22.
//

import Foundation

struct CharacterRickMortyResponse: Codable {
    let results: [CharacterRickMorty]
}

struct CharacterRickMorty: Codable {
    let id: Int
    let name: String
    let image: String
}
