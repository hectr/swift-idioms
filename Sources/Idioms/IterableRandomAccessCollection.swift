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

public protocol IterableRandomAccessCollection: RandomAccessCollection {
    subscript(_ index: (current: Index, previous: Index?, next: Index?)) -> Element { get }
    func validIndex(before index: Index) -> Index?
    func validIndex(after index: Index) -> Index?
    func iterate(_ body: (_ array: Self, _ index: (current: Index, previous: Index?, next: Index?)) throws -> Void) rethrows
}

extension IterableRandomAccessCollection {
    public subscript(_ index: (current: Index, previous: Index?, next: Index?)) -> Element {
        get { return self[index.current] }
    }

    public func validIndex(before index: Index) -> Index? {
        let previousIndex = self.index(before: index)
        guard indices.contains(previousIndex) else { return nil }
        return previousIndex
    }

    public func validIndex(after index: Index) -> Index? {
        let nextIndex = self.index(after: index)
        guard  indices.contains(nextIndex) else { return nil }
        return nextIndex
    }

    public func iterate(_ body: (_ collection: Self, _ index: (current: Index, previous: Index?, next: Index?)) throws -> Void) rethrows {
        guard let firstIndex = indices.first else { return }
        var index: Index! = firstIndex
        while index != nil {
            let previousIndex = self.validIndex(before: index)
            let nextIndex = self.validIndex(after: index)
            try body(self, (current: index, previous: previousIndex, next:nextIndex))
            index = nextIndex
        }
    }
}

public func ==<T: Equatable>(lhs: (current: T, previous: T?, next: T?), rhs: (current: T, previous: T?, next: T?)) -> Bool {
    return lhs.0 == rhs.0 && lhs.1 == rhs.1 && lhs.2 == rhs.2
}

extension DictionaryLiteral: IterableRandomAccessCollection {}
extension DispatchData: IterableRandomAccessCollection {}
extension Repeated: IterableRandomAccessCollection {}
extension Unicode.Scalar.UTF16View: IterableRandomAccessCollection {}
extension UnsafeBufferPointer: IterableRandomAccessCollection {}
