//
//  UserTests.swift
//  SampleApp
//
//  Created by Kazuhiro Furue on 2017/09/02.
//  Copyright © 2017年 Kazuhiro Furue. All rights reserved.
//

import XCTest

@testable import SampleApp

class UserTests: XCTestCase {

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
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testConstructUser() {
        let user = User()
        XCTAssertNotNil(user)
    }

}
