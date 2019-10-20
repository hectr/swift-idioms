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

private protocol Optionable {
    var isNil: Bool { get }
}

extension Optional: Optionable {
    var isNil: Bool {
        switch self {
        case .none:
            return true
        case .some(let wrapped):
            guard let wrapped = wrapped as? Optionable else {
                return false
            }
            return wrapped.isNil
        }
    }
}

extension Dictionary {
    public func deepMerging(_ newDict: [Key: Value]) -> [Key: Value] {
        return merging(newDict) { current, new in
            if let currentAsOptional = current as? Optionable,
                currentAsOptional.isNil {
                return new
            }
            if let newAsOptional = new as? Optionable,
                newAsOptional.isNil {
                return current
            }
            if let new = new as? [AnyHashable: Any],
                let current = current as? [AnyHashable: Any],
                let result = current.deepMerging(new) as? Value {
                return result
            } else {
                return new
            }
        }
    }
}
