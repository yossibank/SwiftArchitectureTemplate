import UIKit

protocol LoginFlowControllerDelegate: AnyObject {
    func didLoginButtonTapped()
}

// MARK: - Stored Properties & Init

final class LoginFlowController: UIViewController {

    private let navVC = NavigationController()

    weak var delegate: LoginFlowControllerDelegate?

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

// MARK: - protocol

extension LoginFlowController: FlowController {

    func start() {
        let vc = Resources.ViewControllers.App.login(flow: self)
        navVC.viewControllers = [vc]
    }
}

// MARK: - delegate

extension LoginFlowController: LoginViewControllerDelegate {

    func didLoginButtonTapped() {
        delegate?.didLoginButtonTapped()
    }
}
