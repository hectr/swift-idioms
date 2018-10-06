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

import Swift

public protocol BooleanControlFlow {
    @discardableResult func then(_ f: () throws -> Void) rethrows -> BooleanAlternateControlFlow
    @discardableResult func then(_ f: @autoclosure () throws -> Void) rethrows -> BooleanAlternateControlFlow
}

public protocol BooleanAlternateControlFlow {
    func `else`(_ f: () throws -> Void) rethrows
    func `else`(_ f: @autoclosure () throws -> Void) rethrows
    
}

extension Bool: BooleanControlFlow {
    @discardableResult public func then(_ f: () throws -> Void) rethrows -> BooleanAlternateControlFlow {
        guard self else { return self }
        try f()
        return self
    }
    
    @discardableResult public func then(_ f: @autoclosure () throws -> Void) rethrows -> BooleanAlternateControlFlow {
        guard self else { return self }
        try f()
        return self
    }
}

extension Bool: BooleanAlternateControlFlow {
    public func `else`(_ f: () throws -> Void) rethrows {
        guard !self else { return }
        try f()
    }
    
    public func `else`(_ f: @autoclosure () throws -> Void) rethrows {
        guard !self else { return }
        try f()
    }
}
