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

class ForLoopTests: XCTestCase {
    func testForLoopFinishes() {
        var i = 100
        var j = 0
        let returned = forLoop(initialization: i = 0, condition: i < 10, afterthought: i += 1, body: { () -> ForLoopStatement<Void> in
            j += 1
            return .continue
        })
        XCTAssertEqual(i, 10)
        XCTAssertEqual(j, 10)
        XCTAssertTrue(returned.wrapped == nil)
    }

    func testForLoopCanThrow() {
        XCTAssertThrowsError(try forLoop(body: { () throws -> ForLoopStatement<Void> in
            throw NSError(domain: #function, code: #line, userInfo: nil)
        }))
    }

    func testForLoopCanBreak() {
        var i = 0
        var j = 0
        _ = forLoop(condition: i < 10, afterthought: i += 1, body: { () -> ForLoopStatement<Void> in
            guard i != 5 else { return .break }
            j += 1
            return .continue
        })
        XCTAssertEqual(i, 5)
        XCTAssertEqual(j, 5)
    }

    func testForLoopCanContinue() {
        var i = 0
        var j = 0
        _ = forLoop(condition: i < 10, afterthought: i += 1, body: { () -> ForLoopStatement<Void> in
            guard i != 5 else { return .continue }
            j += 1
            return .continue
        })
        XCTAssertEqual(i, 10)
        XCTAssertEqual(j, 9)
    }

    func testForCanReturn() {
        var i = 0
        var j = 0
        let returned = forLoop(condition: i < 10, afterthought: i += 1, body: { () -> ForLoopStatement<Int> in
            guard i != 5 else { return .return(2) }
            j += 1
            return .continue
        })
        XCTAssertEqual(i, 5)
        XCTAssertEqual(j, 5)
        XCTAssertEqual(returned.wrapped!, 2)
    }

    static var allTests = [
        ("testForLoopFinishes", testForLoopFinishes),
        ("testForLoopCanThrow", testForLoopCanThrow),
        ("testForLoopCanBreak", testForLoopCanBreak),
        ("testForLoopCanContinue", testForLoopCanContinue),
        ("testForCanReturn", testForCanReturn),
    ]
}
