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

public final class Matrix2D<Element> {
    private var vector: Vector<Vector<Element>>
    
    public subscript(_ row: Int) -> Vector<Element>! {
        get {
            return vector[row]
        }
        set(newValue) {
            vector[row] = newValue
        }
    }

    public init(_ reservedRows: Int, _ reservedColumns: Int = 0) {
        self.vector = Vector<Vector<Element>>(reservedRows)
        for i in 0 ..< reservedLength {
            vector[i] = Vector<Element>(reservedColumns)
        }
    }

    public convenience init(rows: [[Element]]) {
        var reservedColumns = 0
        for row in rows {
            reservedColumns = Swift.max(reservedColumns, row.count)
        }
        self.init(rows.count, reservedColumns)
        for (offset, row) in rows.enumerated() {
            self[offset] = Vector(array: row, reservedLength: reservedColumns)
        }
    }

    public var reservedLength: Int {
        return vector.reservedLength
    }
}

extension Matrix2D: CustomDebugStringConvertible {
    public var debugDescription: String {
        return vector.debugDescription
    }
}

extension Matrix2D: CustomStringConvertible {
    public var description: String {
        return vector.description
    }
}

extension Matrix2D: Equatable where Element: Equatable {
    public static func == (lhs: Matrix2D<Element>, rhs: Matrix2D<Element>) -> Bool {
        guard lhs.reservedLength == rhs.reservedLength else { return false }
        for index in 0 ..< lhs.reservedLength {
            guard lhs[index] == rhs[index] else { return false }
        }
        return true
    }
}
