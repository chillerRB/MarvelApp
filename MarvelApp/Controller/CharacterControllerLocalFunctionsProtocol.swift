//
//  CharacterControllerLocalFunctionsProtocol.swift
//  MarvelApp
//
//  Created by Chiller Rafaele on 9/1/23.
//

import Foundation

protocol CharacterControllerLocalFunctionsProtocol {
    func getCharacters() -> [Character]?
    func getCharacter(withCharacterId characterId: Int) -> Character?
}
