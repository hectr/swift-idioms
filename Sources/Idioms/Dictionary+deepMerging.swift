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
