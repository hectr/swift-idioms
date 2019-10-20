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

final class DictionaryDeepMergingTests: XCTestCase {
    func test() {
        let dict0 = ["user": ["id": "0"]]
        let dict1 = ["user": ["name": "unknown"]]
        let result = dict0.deepMerging(dict1)
        let expected = ["user": ["id": "0", "name": "unknown"]]
        XCTAssertEqual(result, expected)
    }

    func testRewritingValue() {
        let dict0 = ["user": ["id": "0"]]
        let dict1 = ["user": ["id": "1", "name": "unknown"]]
        let result = dict0.deepMerging(dict1)
        let expected = ["user": ["id": "1", "name": "unknown"]]
        XCTAssertEqual(result, expected)
    }

    static var allTests = [
        ("test", test),
        ("testRewritingValue", testRewritingValue),
    ]
}
