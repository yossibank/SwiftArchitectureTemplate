import UIKit

// MARK: - Stored Properties & Init

final class LoginFlowController: UIViewController {

    private let navVC = NavigationController()

    init() {
        super.init(nibName: nil, bundle: nil)
        add(navVC)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - override methods

extension LoginFlowController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        children.first?.view.frame = view.bounds
    }
}

// MARK: - internal methods

extension LoginFlowController {

    func start() {
        let vc = LoginViewController()
        vc.title = "LOGIN"

        navVC.viewControllers = [vc]
    }
}
