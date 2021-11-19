import UIKit

class SelfLoadingViewController: UIViewController {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public init() {
        let defaultResource = type(
            of: self
        ).resourceName

        super.init(
            nibName: defaultResource,
            bundle: nil
        )
    }
}
