import Swift

extension Array {
    public func removingFirst() -> Array<Element> {
        return Array(dropFirst())
    }

    public func removingLast() -> Array<Element> {
        return Array(dropLast())
    }
}
