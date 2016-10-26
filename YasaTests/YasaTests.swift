//
//  YasaTests.swift
//  YasaTests
//
//  Created by Tullio Sebastiani on 25/10/2016.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//

import XCTest
import Yasa

class YasaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let yasa = Yasa()
        yasa.login(username: "tullio", password: "Sebastiani") { entity, error in
            guard let entity = entity else {
                XCTFail()
                return
            }
            XCTAssert(entity.name == "John")
            
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
