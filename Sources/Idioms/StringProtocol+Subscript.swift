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

// Source: https://stackoverflow.com/a/38215613
extension StringProtocol {
    public subscript(offset: Int) -> Element? {
        guard offset >= 0 else { return nil }
        guard let index = index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else { return nil }
        return self[index]
    }

    public subscript(_ range: Range<Int>) -> SubSequence? {
        guard range.lowerBound >= 0 else { return nil }
        let prefixLength = range.lowerBound + range.count
        guard prefixLength >= 0 else { return nil }
        guard prefixLength <= count else { return nil }
        return prefix(prefixLength).suffix(range.count)
    }

    public subscript(range: ClosedRange<Int>) -> SubSequence? {
        guard range.lowerBound >= 0 else { return nil }
        let prefixLength = range.lowerBound + range.count
        guard prefixLength >= 0 else { return nil }
        guard prefixLength <= count else { return nil }
        return prefix(prefixLength).suffix(range.count)
    }

    public subscript(range: PartialRangeThrough<Int>) -> SubSequence? {
        guard range.upperBound >= 0 else { return nil }
        let prefixLength = range.upperBound.advanced(by: 1)
        guard prefixLength >= 0 else { return nil }
        guard prefixLength <= count else { return nil }
        return prefix(prefixLength)
    }

    public subscript(range: PartialRangeUpTo<Int>) -> SubSequence? {
        guard range.upperBound >= 0 else { return nil }
        let prefixLength = range.upperBound
        guard prefixLength >= 0 else { return nil }
        guard prefixLength <= count else { return nil }
        return prefix(prefixLength)
    }

    public subscript(range: PartialRangeFrom<Int>) -> SubSequence? {
        guard range.lowerBound >= 0 else { return nil }
        let suffixLength = count - range.lowerBound
        guard suffixLength >= 0 else { return nil }
        guard suffixLength <= count else { return nil }
        return suffix(suffixLength)
    }
}

