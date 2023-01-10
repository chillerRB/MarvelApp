//
//  CharacterController.swift
//  MarvelApp
//
//  Created by Chiller Rafaele on 8/1/23.
//

import Foundation
import UIKit

class CharacterController {
    
    static let instance = CharacterController()
    
    static let characterUpdatedNotification = Notification.Name("CharacterController.characterUpdated")
    
    private var characters = [Int: Character]()
    
    func processCharacter(characters: [Character]) {
        for character in characters {
            self.characters[character.id] = character
        }
        
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: CharacterController.characterUpdatedNotification, object: nil)
        }
    }
}

//MARK: - Function to use locally
extension CharacterController: CharacterControllerLocalFunctionsProtocol {
    func getCharacters() -> [Character]? {
        return Array(self.characters.values)
    }
    
    func getCharacter(withCharacterId characterId: Int) -> Character? {
        return self.characters[characterId]
    }
}

//MARK:  Load remote data
extension CharacterController: CharacterControllerProtocol {
    func loadCharacters() {
        let task = URLSession.shared.dataTask(with: Urls.instance.getCharacters()){(data,_,error) in
            let jsonDecoder = JSONDecoder()
            
            if let error = error {
                print("CharacterController - Characters: \(error.localizedDescription)")
                return
            }
            
            if let data = data, let response = try? jsonDecoder.decode(ResponseBody.self, from: data){
                if response.code == NetworkConstant.responseCode {
                    self.characters.removeAll()
                    self.processCharacter(characters: response.data.results)
                }
            }
        }
        task.resume()
    }
    
    func loadCharacter(WithId characterId: Int) {
        let task = URLSession.shared.dataTask(with: Urls.instance.getCharacter(WithCharacterId: characterId)){(data,_,error) in
            let jsonDecoder = JSONDecoder()
            
            if let error = error {
                print("CharacterController - Character \(characterId): \(error.localizedDescription)")
                return
            }
            
            if let data = data, let response = try? jsonDecoder.decode(ResponseBody.self, from: data){
                if response.code == NetworkConstant.responseCode {
                    self.processCharacter(characters: response.data.results)
                }
            }
        }
        task.resume()
    }
    
    func fetchImage(url: URL, completion: @escaping(UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url){(data, response, error) in
            if let error = error {
                print("CharacterController - Character image: \(error.localizedDescription)")
                return
            }
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                let placeholderImage = UIImage(named: "placeholder")
                completion(placeholderImage)
            }
        }
        task.resume()
    }
}
