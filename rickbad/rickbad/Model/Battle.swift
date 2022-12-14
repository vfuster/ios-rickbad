//
//  Battle.swift
//  rickbad
//
//  Created by Valeria Fuster on 12/10/22.
//

import Foundation

struct Battle: Codable {
    let winner: String
    let loser: String
    let date: Date
    let image: Data
}
