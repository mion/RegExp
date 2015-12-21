//
//  RegExpTests.swift
//  RegExpTests
//
//  Created by Gabriel Luis Vieira on 12/21/15.
//  Copyright © 2015 mion. All rights reserved.
//

import XCTest
@testable import RegExp

class RegExpTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRegExpOptions() {
        let re1 = RegExp("Hello (.*)")
        XCTAssertTrue( re1.test("Hello world") )
        
        let re2 = RegExp("hello (.*)", .CaseInsensitive)
        XCTAssertTrue( re2.test("HeLlo WoRLD") , "ignored case insensitive option")
        
        let re3 = RegExp("a+b # this is a comment", [.AllowCommentsAndWhitespace, .CaseInsensitive])
        XCTAssertTrue( re3.test("aaaaab") , "ignored comments and whitespace option")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
