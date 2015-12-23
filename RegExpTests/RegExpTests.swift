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
        let regexDotMatchNewLine = RegExp("^Jump(.*)line\\sfoobar$")
        expect(regexDotMatchNewLine.test("Jump\nto\nanother\nline foobar")).to(beTrue(), description: "Ignored default option dot matches line separator")
        
        let regexCaseInsensitive = RegExp("hello (.*)", .CaseInsensitive)
        expect(regexCaseInsensitive.test("HeLlo WoRLD")).to(beTrue(), description: "Ignored case insensitive option")
        
        let regexCommentsWhitespace = RegExp("a+b # this is a comment", .AllowCommentsAndWhitespace)
        expect(regexCommentsWhitespace.test("aaaaab")).to(beTrue(), description: "Ignored comments and whitespace option")
        
        let regexBothOptions = RegExp("he+llo+ # world", [.CaseInsensitive, .AllowCommentsAndWhitespace])
        expect(regexBothOptions.test("heeEEEeeeEeellOooO")).to(beTrue(), description: "ignored both case insensitive and comment+whitespace options")
    }
    
    func testRegExpOperator() {
        let phoneNumber = "Mrs. Jane Smith\nTel.: 9876-6543"
        expect(phoneNumber =~ "^Mrs\\.\\s([^\n]*)\\sTel\\.:\\s\\d{4}-\\d{4}$").to(beTrue())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
