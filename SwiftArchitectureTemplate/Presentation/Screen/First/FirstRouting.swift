import UIKit

final class FirstRouting: Routing {
    weak var viewController: UIViewController?
}

extension FirstRouting {

    func showDetail() {
        self.viewController?.navigationController?.pushViewController(
            FirstDetailViewController(),
            animated: true
        )
    }
}
