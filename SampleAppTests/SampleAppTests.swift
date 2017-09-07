//
//  SampleAppTests.swift
//  SampleAppTests
//
//  Created by Kazuhiro Furue on 2017/08/20.
//  Copyright © 2017年 Kazuhiro Furue. All rights reserved.
//

import XCTest
@testable import SampleApp

class SampleAppTests: XCTestCase {

    override func setUp() {
        super.setUp()
        SampleAppClientAPI.customHeaders["Authorization"]
            = "Bearer 4c80d22739c848bd1e95ff1e8f38c562e72570255fe465ca61779ae4f5bed47d"
    }

    func testSwagger() {
        let getMicropostsExpectation = expectation(description: "Get Microposts")

        FeedAPI.getApiV1Feed { (microposts, error) in
            print(microposts?.count ?? "nil microposts")
            if let microposts = microposts {
                for micropost in microposts {
                    print(micropost.userId ?? "nil userId")
                    print(micropost.content ?? "nil content")
                }
            }
            print(error ?? "nil error")
            getMicropostsExpectation.fulfill()
        }
        waitForExpectations(timeout: 15.0, handler: nil)
    }

}
