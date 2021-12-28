import UIKit

// MARK: - Stored Properties & Init

final class MainFlowController: UIViewController {

    private let tabController = TabBarController()

    init() {
        super.init(nibName: nil, bundle: nil)
        add(tabController)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - override methods

extension MainFlowController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        children.first?.view.frame = view.bounds
    }
}

// MARK: - internal methods

extension MainFlowController {

    func start() {
        let nc1 = FirstFlowController()

        let nc2: NavigationController = {
            let vc = Resources.ViewControllers.App.second()

            let nc = NavigationController(rootViewController: vc)
            nc.tabBarItem.title = "SECOND"
            nc.tabBarItem.image = UIImage(systemName: "b.circle")

            return nc
        }()

        #if !RELEASE
        let nc3: NavigationController = {
            let vc = Resources.ViewControllers.App.debug()

            let nc = NavigationController(rootViewController: vc)
            nc.tabBarItem.title = "DEBUG"
            nc.tabBarItem.image = UIImage(systemName: "c.circle")

            return nc
        }()

        tabController.setViewControllers(
            [nc1, nc2, nc3],
            animated: false
        )
        #else
        tabController.setViewControllers(
            [nc1, nc2],
            animated: false
        )
        #endif

        nc1.start()
    }
}
