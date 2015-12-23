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
            let regexDotMatchNewLine = try RegExp("^Jump(.*)line\\sfoobar$")
            expect(regexDotMatchNewLine.test("Jump\nto\nanother\nline foobar")).to(beTrue(), description: "Ignored default option dot matches line separator")
            
            let regexCaseInsensitive = try RegExp("hello (.*)", .CaseInsensitive)
            expect(regexCaseInsensitive.test("HeLlo WoRLD")).to(beTrue(), description: "Ignored case insensitive option")
            
            let regexCommentsWhitespace = try RegExp("a+b # this is a comment", .AllowCommentsAndWhitespace)
            expect(regexCommentsWhitespace.test("aaaaab")).to(beTrue(), description: "Ignored comments and whitespace option")
            
            let regexBothOptions = try RegExp("he+llo+ # world", [.CaseInsensitive, .AllowCommentsAndWhitespace])
            expect(regexBothOptions.test("heeEEEeeeEeellOooO")).to(beTrue(), description: "ignored both case insensitive and comment+whitespace options")
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
