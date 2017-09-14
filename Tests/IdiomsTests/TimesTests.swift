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

class TimesTests: XCTestCase {
    func testNegativeTimes() {
        let value = -1
        var count = 0
        value.times { count += 1 }
        XCTAssertEqual(count, 0)
    }

    func testZeroTimes() {
        let value = 0
        var count = 0
        value.times { count += 1 }
        XCTAssertEqual(count, value)
    }
    
    func testOneTimes() {
        let value = 1
        var count = 0
        value.times { count += 1 }
        XCTAssertEqual(count, value)
    }
    
    func testTwoTimes() {
        let value = 2
        var count = 0
        value.times { count += 1 }
        XCTAssertEqual(count, value)
    }
    
    func testThirtyTimes() {
        let value = 30
        var count = 0
        value.times { count += 1 }
        XCTAssertEqual(count, value)
    }
    
    func testNegativeTimesWithAutoclosure() {
        let value = -1
        var count = 0
        value.times(count += 1)
        XCTAssertEqual(count, 0)
    }
    
    func testZeroTimesWithAutoclosure() {
        let value = 0
        var count = 0
        value.times(count += 1)
        XCTAssertEqual(count, value)
    }
    
    func testOneTimesWithAutoclosure() {
        let value = 1
        var count = 0
        value.times(count += 1)
        XCTAssertEqual(count, value)
    }
    
    func testTwoTimesWithAutoclosure() {
        let value = 2
        var count = 0
        value.times(count += 1)
        XCTAssertEqual(count, value)
    }
    
    func testThirtyTimesWithAutoclosure() {
        let value = 30
        var count = 0
        value.times(count += 1)
        XCTAssertEqual(count, value)
    }
    
    static var allTests = [
        ("testNegativeTimes", testNegativeTimes),
        ("testZeroTimes", testZeroTimes),
        ("testOneTimes", testOneTimes),
        ("testTwoTimes", testTwoTimes),
        ("testThirtyTimes", testThirtyTimes),
        ("testNegativeTimesWithAutoclosure", testNegativeTimesWithAutoclosure),
        ("testZeroTimesWithAutoclosure", testZeroTimesWithAutoclosure),
        ("testOneTimesWithAutoclosure", testOneTimesWithAutoclosure),
        ("testTwoTimesWithAutoclosure", testTwoTimesWithAutoclosure),
        ("testThirtyTimesWithAutoclosure", testThirtyTimesWithAutoclosure)
    ]
}
