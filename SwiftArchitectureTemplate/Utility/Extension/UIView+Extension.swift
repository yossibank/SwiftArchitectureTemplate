import UIKit

extension UIView {

    func pin(to: UIView) {
        self.layout {
            $0.top == to.topAnchor
            $0.bottom == to.bottomAnchor
            $0.leading == to.leadingAnchor
            $0.trailing == to.trailingAnchor
        }
    }
}
