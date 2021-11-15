import Foundation

extension NSObject {

    var className: String {
        String(describing: type(of: self))
    }
}
