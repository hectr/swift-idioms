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

import Foundation

public protocol BooleanControlFlow {
    @discardableResult func then(_ f: () -> Void) -> BooleanAlternateControlFlow
    @discardableResult func then(_ f: @autoclosure () -> Void) -> BooleanAlternateControlFlow
}

public protocol BooleanAlternateControlFlow {
    func `else`(_ f: () -> Void)
    func `else`(_ f: @autoclosure () -> Void)
    
}

extension Bool: BooleanControlFlow {
    @discardableResult public func then(_ f: () -> Void) -> BooleanAlternateControlFlow {
        guard self else { return self }
        f()
        return self
    }
    
    @discardableResult public func then(_ f: @autoclosure () -> Void) -> BooleanAlternateControlFlow {
        guard self else { return self }
        f()
        return self
    }
}

extension Bool: BooleanAlternateControlFlow {
    public func `else`(_ f: () -> Void) {
        guard !self else { return }
        f()
    }
    
    public func `else`(_ f: @autoclosure () -> Void) {
        guard !self else { return }
        f()
    }
}
