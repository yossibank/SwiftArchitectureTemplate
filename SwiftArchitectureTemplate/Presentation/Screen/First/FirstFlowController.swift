import UIKit

// MARK: - stored properties & init

final class FirstFlowController: UIViewController {
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

extension FirstFlowController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        children.first?.view.frame = tabBarController?.view.bounds ?? .zero
    }
}

// MARK: - protocol

extension FirstFlowController: FlowController {

    func start() {
        let vc = Resources.ViewControllers.App.first()
        vc.delegate = self

        tabBarItem.title = "FIRST"
        tabBarItem.image = UIImage(systemName: "a.circle")

        navVC.viewControllers = [vc]
    }
}

// MARK: - delegate

extension FirstFlowController: FirstViewControllerDelegate {

    func didNextButtonTapped() {
        navVC.pushViewController(
            Resources.ViewControllers.App.firstDetail(),
            animated: true
        )
    }
}
