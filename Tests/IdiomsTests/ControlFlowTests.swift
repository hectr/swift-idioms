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

class ControlFlowTests: XCTestCase {
    func testThenIsNotExecutedOnFalseBoolean() {
        let boolean = false
        boolean.then { XCTFail() }
    }
    
    func testThenIsExecutedOnTrueBoolean() {
        let boolean = true
        var executed = false
        boolean.then { executed = true }
        XCTAssertTrue(executed)
    }
    
    func testElseIsExecutedOnFalseBoolean() {
        let boolean = false
        var executed = false
        boolean.else { executed = true }
        XCTAssertTrue(executed)
    }
    
    func testElseIsNotExecutedOnTrueBoolean() {
        let boolean = true
        boolean.else { XCTFail() }
    }
    
    func testElseIsExecutedOnFalseBooleanAfterThen() {
        let boolean = false
        var executed = false
        boolean
            .then {}
            .else { executed = true }
        XCTAssertTrue(executed)
    }
    
    func testElseIsNotExecutedOnTrueBooleanAfterThen() {
        let boolean = true
        boolean
            .then {}
            .else { XCTFail() }
    }
    
    func testThenIsNotExecutedOnFalseBooleanWithAutoclosure() {
        let boolean = false
        boolean.then(XCTFail())
    }
    
    func testThenIsExecutedOnTrueBooleanWithAutoclosure() {
        let boolean = true
        var executed = false
        boolean.then(executed = true)
        XCTAssertTrue(executed)
    }
    
    func testElseIsExecutedOnFalseBooleanWithAutoclosure() {
        let boolean = false
        var executed = false
        boolean.else(executed = true)
        XCTAssertTrue(executed)
    }

    func testElseIsNotExecutedOnTrueBooleanWithAutoclosure() {
        let boolean = true
        boolean.else(XCTFail())
    }
    
    func testElseIsExecutedOnFalseBooleanAfterThenWithAutoclosure() {
        let boolean = false
        var executed = false
        boolean
            .then {}
            .else(executed = true)
        XCTAssertTrue(executed)
    }
    
    func testElseIsNotExecutedOnTrueBooleanAfterThenWithAutoclosure() {
        let boolean = true
        boolean
            .then {}
            .else(XCTFail())
    }

    func testThenRethrowsError() {
        let boolean = true
        XCTAssertThrowsError(try boolean.then { throw NSError() })
    }

    func testElseRethrowsError() {
        let boolean = false
        XCTAssertThrowsError(try boolean.else { throw NSError() })
    }
    
    static var allTests = [
        ("testThenIsNotExecutedOnFalseBoolean", testThenIsNotExecutedOnFalseBoolean),
        ("testThenIsExecutedOnTrueBoolean", testThenIsExecutedOnTrueBoolean),
        ("testElseIsExecutedOnFalseBoolean", testElseIsExecutedOnFalseBoolean),
        ("testElseIsNotExecutedOnTrueBoolean", testElseIsNotExecutedOnTrueBoolean),
        ("testElseIsExecutedOnFalseBooleanAfterThen", testElseIsExecutedOnFalseBooleanAfterThen),
        ("testElseIsNotExecutedOnTrueBooleanAfterThen", testElseIsNotExecutedOnTrueBooleanAfterThen),
        ("testThenIsNotExecutedOnFalseBooleanWithAutoclosure", testThenIsNotExecutedOnFalseBooleanWithAutoclosure),
        ("testThenIsExecutedOnTrueBooleanWithAutoclosure", testThenIsExecutedOnTrueBooleanWithAutoclosure),
        ("testElseIsExecutedOnFalseBooleanWithAutoclosure", testElseIsExecutedOnFalseBooleanWithAutoclosure),
        ("testElseIsNotExecutedOnTrueBooleanWithAutoclosure", testElseIsNotExecutedOnTrueBooleanWithAutoclosure),
        ("testElseIsExecutedOnFalseBooleanAfterThenWithAutoclosure", testElseIsExecutedOnFalseBooleanAfterThenWithAutoclosure),
        ("testElseIsNotExecutedOnTrueBooleanAfterThenWithAutoclosure", testElseIsNotExecutedOnTrueBooleanAfterThenWithAutoclosure),
        ("testThenRethrowsError", testThenRethrowsError),
        ("testElseRethrowsError", testElseRethrowsError),
    ]
}
