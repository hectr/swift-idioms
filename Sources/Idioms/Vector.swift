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

import Swift

public final class Vector<Element> {
    private var array: [Element?] {
        didSet {
            reservedLength = Swift.max(reservedLength, array.count)
        }
    }
    
    public private(set) var reservedLength: Int {
        didSet {
            assert(reservedLength >= size)
        }
    }
    
    public subscript(_ index: Int) -> Element? {
        get {
            guard array.count > index || index >= reservedLength else { return nil }
            return array[index]
        }
        set(newValue) {
            while index >= array.count && index < reservedLength {
                array.append(nil)
            }
            array[index] = newValue
        }
    }

    public init(array: [Element], reservedLength: Int? = nil) {
        self.array = array
        self.reservedLength = Swift.max(reservedLength ?? 0, array.count)
    }
    
    public init(_ reservedLength: Int = 0) {
        self.array = [Element?]()
        self.reservedLength = reservedLength
    }
    
    public var size: Int {
        return array.count
    }
    
    public func get(_ index: Int) -> Element {
        guard let element = self[index] else { fatalError("\(#function): index (\(index)) out of bounds (\(reservedLength))") }
        return element
    }
    
    public func add(_ newElement: Element) {
        array.append(newElement)
    }
    
    @discardableResult
    public func remove(at index: Int) -> Element? {
        var removedObject: Element?
        if index < array.count {
            removedObject = array[index]
            array.remove(at: index)
        } else if index >= reservedLength {
            preconditionFailure("Index out of range: \(index) is beyond count (\(array.count) and reservedLength \(reservedLength)")
        }
        reservedLength -= 1
        return removedObject
    }
}

extension Vector where Element: Equatable {
    public func contains(_ element: Element) -> Bool {
        return array.contains(element)
    }
    
    @discardableResult
    public func remove(element: Element) -> Bool {
        if let index = array.firstIndex(of: element) {
            array.remove(at: -index.distance(to: 0))
            return true
        }
        return false
    }
}

extension Vector: CustomDebugStringConvertible {
    public var debugDescription: String {
        return array.debugDescription
    }
}

extension Vector: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}

extension Vector: Equatable where Element: Equatable {
    public static func == (lhs: Vector<Element>, rhs: Vector<Element>) -> Bool {
        guard lhs.reservedLength == rhs.reservedLength else { return false }
        guard lhs.size == rhs.size else { return false }
        for index in 0 ..< lhs.size {
            guard lhs[index] == rhs[index] else { return false }
        }
        return true
    }
}
