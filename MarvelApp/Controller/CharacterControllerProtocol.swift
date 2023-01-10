//
//  CharacterControllerProtocol.swift
//  MarvelApp
//
//  Created by Chiller Rafaele on 9/1/23.
//

import Foundation
import UIKit

protocol CharacterControllerProtocol {
    func loadCharacters()
    func loadCharacter(WithId characterId: Int)
    func fetchImage(url: URL, completion: @escaping(UIImage?) -> Void)
}
