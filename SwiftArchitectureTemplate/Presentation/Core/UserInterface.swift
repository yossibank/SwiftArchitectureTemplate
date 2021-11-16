import UIKit

protocol UserInterface {
    func configureNavigationBar(viewController: UIViewController)
    func setupView(rootView: UIView)
    func setupLayout(rootView: UIView)
}

final class NoUserInterface: UserInterface {

    func configureNavigationBar(viewController _: UIViewController) {
        assertionFailure("no need to implement")
    }

    func setupView(rootView _: UIView) {
        assertionFailure("no need to implement")
    }

    func setupLayout(rootView _: UIView) {
        assertionFailure("no need to implement")
    }
}
