//
//  CharacterControllerTests.swift
//  MarvelAppTests
//
//  Created by Chiller Rafaele on 11/1/23.
//

import XCTest
@testable import MarvelApp

final class CharacterControllerTests: XCTestCase {

    var sut: CharacterController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CharacterController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testNetwowrkResponseCodeIsEqualTo200() throws {

        let task = URLSession.shared.dataTask(with: Urls.instance.getCharacters()){(data,_,error) in
            let jsonDecoder = JSONDecoder()
            
            XCTAssertNil(error, "CharacterControllerTests - Get Characters an error ocurred: \(String(describing: error?.localizedDescription))")
            
            if let data = data, let response = try? jsonDecoder.decode(ResponseBody.self, from: data) {
                XCTAssertTrue(response.code == NetworkConstant.responseCode)
            }
        }
        task.resume()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
