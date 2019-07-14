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

public struct VectorIterator<Element>: IteratorProtocol {
    private let vector: Vector<Element>
    private var currentIndex = -1

    fileprivate init(vector: Vector<Element>) {
        self.vector = vector
    }

    mutating public func next() -> Element? {
        currentIndex += 1
        guard vector.size > currentIndex else { return nil }
        guard let element = vector[currentIndex] else { return next() }
        return element
    }
}

extension Vector: Sequence {
    public func makeIterator() -> VectorIterator<Element> {
        return VectorIterator(vector: self)
    }
}
