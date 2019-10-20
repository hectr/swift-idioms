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

class VectorTests: XCTestCase {
    func testReservedLengthInit() {
        let reservedLength = 5
        let sut = Vector<Bool>(reservedLength)
        XCTAssertEqual(sut.reservedLength, reservedLength)
    }
    
    func testReservedLengthGetter() {
        let sut = Vector<Bool>(1)
        let reservedLength = 5
        reservedLength.times { sut.add(true) }
        XCTAssertEqual(sut.reservedLength, reservedLength)
    }
    
    func testSizeGetter() {
        let sut = Vector<Bool>()
        3.times { sut.add(true) }
        2.times { sut.remove(at: 0) }
        XCTAssertEqual(sut.size, 1)
    }
    
    func testSubscriptGetter() {
        let element = true
        let sut = Vector(array: [false, element, false])
        XCTAssertEqual(sut[1], element)
    }
    
    func testSubscriptSetter() {
        let element = false
        let sut = Vector(array: [false, !element, false])
        sut[1] = element
        XCTAssertEqual(sut[1], element)
    }
    
    func testGetIndex() {
        let element = false
        let sut = Vector(array: [element, true, false])
        XCTAssertEqual(sut.get(0), element)
    }
    
    func testAddElement() {
        let element = true
        let sut = Vector<Bool>()
        sut.add(element)
        XCTAssertEqual(sut[0], element)
    }

    func testRemoveAtIndex() {
        let sut = Vector(array: [true, false, true])
        let removed = sut.remove(at: 1)
        XCTAssertEqual(removed, false)
        XCTAssertEqual(sut.size, 2)
        XCTAssertEqual(sut[0], true)
        XCTAssertEqual(sut[1], true)
    }
    
    func testRemoveElement() {
        let sut = Vector(array: [true, false, true])
        let removed = sut.remove(element: false)
        XCTAssertTrue(removed)
        XCTAssertEqual(sut.size, 2)
        XCTAssertEqual(sut[0], true)
        XCTAssertEqual(sut[1], true)
    }
    
    func testContains() {
        let a = Vector(array: [true, true, true])
        let b = Vector(array: [true, false, true])
        XCTAssertFalse(a.contains(false))
        XCTAssertTrue(b.contains(false))
    }
    
    func testEquatable() {
        let a = Vector(array: [true, false, true])
        let b = Vector(array: [true, true, true])
        let c = Vector<Bool>()
        3.times { c.add(true) }
        XCTAssertNotEqual(a, b)
        XCTAssertEqual(b, c)
    }
    
    func testIterator() {
        let sut = Vector(array: [true, false, true])
        var elements = [Bool]()
        for e in sut {
            elements.append(e)
        }
        XCTAssertEqual(elements, [true, false, true])
    }
    
    static var allTests = [
        ("testReservedLengthInit", testReservedLengthInit),
        ("testReservedLengthGetter", testReservedLengthGetter),
        ("testSizeGetter", testSizeGetter),
        ("testSubscriptGetter", testSubscriptGetter),
        ("testSubscriptSetter", testSubscriptSetter),
        ("testGetIndex", testGetIndex),
        ("testAddElement", testAddElement),
        ("testRemoveAtIndex", testRemoveAtIndex),
        ("testRemoveElement", testRemoveElement),
        ("testContains", testContains),
        ("testEquatable", testEquatable),
        ("testIterator", testIterator),
    ]
}
