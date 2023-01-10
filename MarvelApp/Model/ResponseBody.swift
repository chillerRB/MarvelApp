//
//  ResponseBody.swift
//  MarvelApp
//
//  Created by Chiller Rafaele on 8/1/23.
//

import Foundation

struct ResponseBody: Codable {
    let code: Int
    let status: String
    let data: Body
    
    enum CodingKeys: String, CodingKey {
        case code
        case status
        case data
    }
}

struct Body: Codable {
    let offset: Int
    let limit: Int
    let results: [Character]
    
    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case results
    }
}
