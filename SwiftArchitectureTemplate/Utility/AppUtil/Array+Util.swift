extension Array where Element: Any {

    func any(at position: Int) -> Element? {
        if position < self.startIndex || position >= self.endIndex {
            return nil
        }

        return self[position]
    }

    func any(at position: Int?) -> Element? {
        if let position = position {
            return self.any(at: position)
        }

        return nil
    }
}

extension Array where Element: Equatable {

    mutating func remove(value: Element) {
        if let i = self.firstIndex(of: value) {
            self.remove(at: i)
        }
    }
}
