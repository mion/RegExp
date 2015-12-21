//
//  RegExp.swift
//  RegExp
//
//  Created by Gabriel Luis Vieira on 12/21/15.
//  Copyright © 2015 mion. All rights reserved.
//

import Foundation

public struct RegExpOptions : OptionSetType {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    
    public static let CaseInsensitive = RegExpOptions(rawValue: 1)
    public static let AllowCommentsAndWhitespace = RegExpOptions(rawValue: 2)
}

public class RegExp {
//    internal var expression: NSRegularExpression
    
    public init(_ pattern: String, _ options: RegExpOptions = []) {
    }
    
    public func test(text: String) -> Bool {
        return false
    }
}