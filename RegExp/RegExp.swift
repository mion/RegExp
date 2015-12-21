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

public enum RegExpError: ErrorType {
    case InvalidPattern(pattern: String)
}

public class RegExp {
    internal let regularExpression: NSRegularExpression!
    
    public init(_ pattern: String, _ options: RegExpOptions = []) throws {
        do {
            var regularExpressionOptions: NSRegularExpressionOptions = [.DotMatchesLineSeparators]
            if options.contains(RegExpOptions.CaseInsensitive) {
                regularExpressionOptions.unionInPlace(.CaseInsensitive)
            }
            if options.contains(RegExpOptions.AllowCommentsAndWhitespace) {
                regularExpressionOptions.unionInPlace(.AllowCommentsAndWhitespace)
            }
            regularExpression = try NSRegularExpression(pattern: pattern, options: regularExpressionOptions)
        } catch {
            regularExpression = nil
            throw RegExpError.InvalidPattern(pattern: pattern)
        }
    }
    
    public func test(text: String) -> Bool {
        let matches = self.regularExpression.matchesInString(text, options: [], range: NSMakeRange(0, text.characters.count))
        return matches.count > 0
    }
}