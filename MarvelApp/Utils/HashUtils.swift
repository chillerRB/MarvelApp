//
//  HashUtils.swift
//  MarvelApp
//
//  Created by Chiller Rafaele on 8/1/23.
//

import Foundation
import CryptoKit

class HashUtils {
    
    static func hashToMD5(_ value: String) -> String {
        let data = value.data(using: .utf8)!
        let computedValue = Insecure.MD5.hash(data: data)
        let hashedStringValue = computedValue.map { String(format: "%02hhx", $0) }.joined()
        print("HassUtils MD5 hashedStringValue: \(hashedStringValue)")
        return hashedStringValue
    }
}
