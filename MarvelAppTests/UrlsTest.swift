//
//  UrlsTest.swift
//  MarvelAppTests
//
//  Created by Chiller Rafaele on 10/1/23.
//

import XCTest
@testable import MarvelApp

final class UrlsTest: XCTestCase {

    var sut: Urls!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Urls()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testGetCharactersUrlIsNotEqual_becauseTimeStampChangeEachSecond() throws {
        let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?ts=1673391850.070065&apikey=235cbd392d42660365b590b8a08b5f58&hash=f0615690d4321436d4c20c8e73d51a93")!
        let urlRequest = URLRequest(url: url)
        let result = sut.getCharacters()
        XCTAssertTrue(result != urlRequest)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
