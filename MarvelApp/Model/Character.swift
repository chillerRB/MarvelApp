//
//  Character.swift
//  MarvelApp
//
//  Created by Chiller Rafaele on 8/1/23.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let description: String
    let modified: String
    let image: Picture
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case modified
        case image = "thumbnail"
    }
    
    func dateStringtoDate() -> Date {
        return DateUtils.dateStringToDate(dateString: modified)
    }
    
    static func == (lCharacter: Character, rCharacter: Character) -> Bool {
        return lCharacter.id == rCharacter.id
    }
}

struct Picture: Codable {
    let path: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case type = "extension"
    }
}
