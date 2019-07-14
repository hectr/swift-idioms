// Copyright (c) 2018 Hèctor Marquès Ranea
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

class Matrix2DTests: XCTestCase {
    func testInit() {
        let sut = Matrix2D<Bool>(2, 3)
        XCTAssertEqual(sut[0], Vector(3))
        XCTAssertEqual(sut[1], Vector(3))
    }

    func testInitWithRows() {
        let sut = Matrix2D<Bool>(rows: [[true, false], [false, true]])
        XCTAssertEqual(sut[0], Vector(array: [true, false]))
        XCTAssertEqual(sut[1], Vector(array: [false, true]))
    }
    
    func testReservedLength() {
        let reservedLength = 3
        let sut = Matrix2D<Bool>(reservedLength)
        XCTAssertEqual(sut.reservedLength, reservedLength)
    }
    
    func testsubscriptGetter() {
        let sut = Matrix2D<Bool>(rows: [[false]])
        XCTAssertEqual(sut[0], Vector(array: [false]))
    }
    
    func testsubscriptSetter() {
        let sut = Matrix2D<Bool>(1)
        sut[0] = Vector(array: [true])
        XCTAssertEqual(sut[0], Vector(array: [true]))
    }

    func testIterator() {
        let a = Matrix2D(rows: [[true, false, true]])
        let b = Vector(array: [true, false, true])
        var elementsA = [Bool]()
        var elementsB = [Bool]()
        for e in a {
            elementsA.append(e)
        }
        for e in b {
            elementsB.append(e)
        }
        XCTAssertEqual(elementsA, elementsB)
    }
    
    static var allTests = [
        ("testInit", testInit),
        ("testInitWithRows", testInitWithRows),
        ("testReservedLength", testReservedLength),
        ("testsubscriptGetter", testsubscriptGetter),
        ("testsubscriptSetter", testsubscriptSetter),
        ("testIterator", testIterator),
    ]
}
