// Copyright (c) 2017 Hèctor Marquès Ranea
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import XCTest
import Idioms

class StringProtocolSubscriptTests: XCTestCase {
    let string = "Hello USA 🇺🇸!!! Hello Brazil 🇧🇷!!!" // Source: https://stackoverflow.com/a/38215613
    let abcde = "abcde" // Source: https://iswift.org/playground?IqCu7c&v=4

    func testStringSubscripts() {
        XCTAssertEqual(string[10], "🇺🇸")
        XCTAssertEqual(string[11], "!")
        XCTAssertEqual(string[10...], "🇺🇸!!! Hello Brazil 🇧🇷!!!")
        XCTAssertEqual(string[0..<1], "H")
        XCTAssertEqual(string[10..<12], "🇺🇸!")
        XCTAssertEqual(string[0..<string.count], "Hello USA 🇺🇸!!! Hello Brazil 🇧🇷!!!")
        XCTAssertEqual(string[0...1], "He")
        XCTAssertEqual(string[10...12], "🇺🇸!!")
        XCTAssertEqual(string[0...(string.count - 1)], "Hello USA 🇺🇸!!! Hello Brazil 🇧🇷!!!")
        XCTAssertEqual(string[...10], "Hello USA 🇺🇸")
        XCTAssertEqual(string[..<10], "Hello USA ")
        XCTAssertEqual(string[..<32], "Hello USA 🇺🇸!!! Hello Brazil 🇧🇷!!!")
        XCTAssertEqual(string[...31], "Hello USA 🇺🇸!!! Hello Brazil 🇧🇷!!!")
        XCTAssertEqual(string.first, "H")
        XCTAssertEqual(string.last, "!")
    }

    func testSubstringSubscript() {
        XCTAssertEqual(string[...][...3], "Hell")
    }

    func testNegativeIndex() {
        XCTAssertNil(string[-1])
        XCTAssertNil(string[(-1)...])
        XCTAssertNil(string[(-1)..<2])
        XCTAssertNil(string[(-1)...2])
        XCTAssertNil(string[...(-1)])
        XCTAssertNil(string[..<(-1)])
    }

    func testOutOfBounds() {
        XCTAssertNil(string[110])
        XCTAssertNil(string[111])
        XCTAssertNil(string[110...])
        XCTAssertNil(string[10..<112])
        XCTAssertNil(string[10...112])
        XCTAssertNil(string[...110])
        XCTAssertNil(string[..<110])
    }

    func testABCDEString() {
        XCTAssertEqual(abcde[1], "b")
        XCTAssertEqual(abcde[1..<3], "bc")
        XCTAssertEqual(abcde[1...3], "bcd")
        XCTAssertEqual(abcde[1...], "bcde")
        XCTAssertEqual(abcde[...3], "abcd")
        XCTAssertEqual(abcde[..<3], "abc")
    }

    func testABCDESubstring() {
        let sub = abcde[0...]!
        XCTAssertEqual(sub[1], "b")
        XCTAssertEqual(sub[1..<3], "bc")
        XCTAssertEqual(sub[1...3], "bcd")
        XCTAssertEqual(sub[1...], "bcde")
        XCTAssertEqual(sub[...3], "abcd")
        XCTAssertEqual(sub[..<3], "abc")
    }

    static var allTests = [
        ("testStringSubscripts", testStringSubscripts),
        ("testSubstringSubscript", testSubstringSubscript),
        ("testNegativeIndex", testNegativeIndex),
        ("testNegativeIndex", testNegativeIndex),
        ("testOutOfBounds", testOutOfBounds),
        ("testABCDEString", testABCDEString),
        ("testABCDESubstring", testABCDESubstring),
    ]
}
