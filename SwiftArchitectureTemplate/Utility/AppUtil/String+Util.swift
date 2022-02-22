import Foundation

extension String {

    static var blank: String {
        ""
    }

    func contain(pattern: String) -> Bool {
        guard
            let regex = try? NSRegularExpression(
                pattern: pattern,
                options: .init()
            )
        else {
            return false
        }

        let isFirstMatch = regex.firstMatch(
            in: self,
            options: .init(),
            range: NSMakeRange(0, count)
        )

        return isFirstMatch != nil
    }

    func addSpaceAfterUppercase() -> String {
        map { $0.description.contain(pattern: "[A-Z]")
            ? String(" \($0)")
            : String($0)
        }.joined()
    }
}
