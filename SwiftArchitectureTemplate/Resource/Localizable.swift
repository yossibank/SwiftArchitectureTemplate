import Foundation

@propertyWrapper
struct Localizable {

    init(wrappedValue: String) {
        self.wrappedValue = NSLocalizedString(wrappedValue, comment: "")
    }

    var wrappedValue: String {
        didSet {
            self.wrappedValue = NSLocalizedString(self.wrappedValue, comment: "")
        }
    }
}
