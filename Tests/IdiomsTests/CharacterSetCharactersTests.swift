// Copyright (c) 2019 Hèctor Marquès Ranea
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

class CharacterSetCharactersTests: XCTestCase {
    private func allCharacters(from characterSet: CharacterSet) -> [String] {
        // Source: https://stackoverflow.com/a/52133647
        func codePoints() -> [Int] {
            var result: [Int] = []
            var plane = 0
            for (i, w) in characterSet.bitmapRepresentation.enumerated() {
                let k = i % 8193
                if k == 8192 {
                    plane = Int(w) << 13
                    continue
                }
                let base = (plane + k) << 3
                for j in 0 ..< 8 where w & 1 << j != 0 {
                    result.append(base + j)
                }
            }
            return result
        }
        return codePoints().compactMap { UnicodeScalar($0) }.map { Character($0) }.map { String($0) }
    }

    func testComparingToAlternativeImplementation0() {
        let expected = allCharacters(from: CharacterSet.decimalDigits)
        let result = CharacterSet.decimalDigits.characters
        XCTAssertEqual(result, expected)
    }

    func testComparingToAlternativeImplementation1() {
        let expected = allCharacters(from: CharacterSet.whitespaces)
        let result = CharacterSet.whitespaces.characters
        XCTAssertEqual(result, expected)
    }

    func testComparingToCannedArray() {
        let expected = ["!", "$", "&", "\'", "(", ")", "*", "+", ",", "-", ".", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ";", "=", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "_", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "~"]
        let result = CharacterSet.urlPasswordAllowed.characters
        XCTAssertEqual(result, expected)
    }
    
    static var allTests = [
        ("testComparingToAlternativeImplementation0", testComparingToAlternativeImplementation0),
        ("testComparingToAlternativeImplementation1", testComparingToAlternativeImplementation1),
        ("testComparingToCannedArray", testComparingToCannedArray),
    ]
}
