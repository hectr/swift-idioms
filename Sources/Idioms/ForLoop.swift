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

public enum ForLoopStatement<V> {
    case `continue`
    case `break`
    case `return`(V)
}

public enum ForLoopResult<V> {
    case none
    case value(V)

    public var wrapped: V? {
        switch self {
        case .none: return nil
        case .value(let wrapped): return wrapped
        }
    }
}

public func forLoop<V>(initialization: () throws -> Void = {}, condition: () throws -> Bool, afterthought: () throws -> Void = {}, body: () throws -> ForLoopStatement<V>) rethrows -> ForLoopResult<V> {
    try initialization()
    while try condition() {
        let result = try body()
        switch result {
        case .continue:
            try afterthought()
        case .break:
            return .none
        case .return(let value):
            return .value(value)
        }
    }
    return .none
}



public func forLoop<V>(initialization: @autoclosure () -> Void = (), condition: @autoclosure () -> Bool = true, afterthought: @autoclosure () -> Void = (), body: () throws -> ForLoopStatement<V>) rethrows -> ForLoopResult<V> {
    initialization()
    while condition() {
        let result = try body()
        switch result {
        case .continue:
            afterthought()
        case .break:
            return .none
        case .return(let value):
            return .value(value)
        }
    }
    return .none
}
