//
//  RegExpTests.swift
//  RegExpTests
//
//  Created by Gabriel Luis Vieira on 12/21/15.
//  Copyright © 2015 mion. All rights reserved.
//

import XCTest
import Nimble
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
        do {
            let re1 = try RegExp("^Jump(.*)line\\sfoobar$")
            XCTAssertTrue(re1.test("Jump\nto\nanother\nline foobar"), "ignored default option dot matches line separator")
            
            let re2 = try RegExp("hello (.*)", .CaseInsensitive)
            XCTAssertTrue(re2.test("HeLlo WoRLD"), "ignored case insensitive option")
            
            let re3 = try RegExp("a+b # this is a comment", .AllowCommentsAndWhitespace)
            XCTAssertTrue(re3.test("aaaaab"), "ignored comments and whitespace option")
            
            let re4 = try RegExp("he+llo+ # world", [.CaseInsensitive, .AllowCommentsAndWhitespace])
            XCTAssertTrue(re4.test("heeEEEeeeEeellOooO"), "ignored both case insensitive and comment+whitespace options")
        } catch {
            XCTAssert(false, "invalid pattern")
        }
    }
    
    func testRegExpOperator() {
        let phoneNumber = "Tel.: 9876-6543"
        XCTAssertTrue(phoneNumber =~ "\\d{4}-\\d{4}")
        
        let fullName = "Mrs. Jane Smith"
        XCTAssertTrue(fullName =~ "^Mrs.\\s(.*)$")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
