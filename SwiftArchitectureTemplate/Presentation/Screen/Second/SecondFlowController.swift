import UIKit

// MARK: - stored properties & init

final class SecondFlowController: UIViewController {
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

extension SecondFlowController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        children.first?.view.frame = tabBarController?.view.bounds ?? .zero
    }
}

// MARK: - protocol

extension SecondFlowController: FlowController {
    func start() {
        let vc = Resources.ViewControllers.App.second()

        tabBarItem.title = "SECOND"
        tabBarItem.image = UIImage(systemName: "b.circle")

        navVC.viewControllers = [vc]
    }
}
