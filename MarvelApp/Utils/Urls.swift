//
//  Urls.swift
//  MarvelApp
//
//  Created by Chiller Rafaele on 8/1/23.
//

import Foundation
import CryptoKit

class Urls {
    
    static let instance = Urls()
    
    func getCharacters() -> URLRequest {
        let url = NetworkConstant.baseUrl + NetworkConstant.charactersUrl + buildQueryString()
        print("url characters: \(url)")
        return URLRequest(url: URL(string: url)!)
    }
    
    func getCharacter(WithCharacterId characterId: Int) -> URLRequest {
        let url = NetworkConstant.baseUrl + NetworkConstant.charactersUrl + "/\(characterId)" + buildQueryString()
        print("url character: \(url)")
        return URLRequest(url: URL(string: url)!)
    }
    
    private func buildQueryString() -> String {
        let timeStamp = String(Date().timeIntervalSince1970)
        print("URLS: TimeStamp: \(timeStamp)")
        let query = "?ts=\(timeStamp)&apikey=\(NetworkConstant.publicKey)&hash=\(buildHashToken(timeStamp: timeStamp))"
        return query
    }
    
    private func buildHashToken(timeStamp: String) -> String {
        let unHashedString = timeStamp + NetworkConstant.privatyKey + NetworkConstant.publicKey
        return HashUtils.hashToMD5(unHashedString)
    }
}
