import UIKit

// MARK: - Stored Properties & Init

final class DEBUG_FlowController: UIViewController {

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

extension DEBUG_FlowController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        children.first?.view.frame = tabBarController?.view.bounds ?? .zero
    }
}

// MARK: - internal methods

extension DEBUG_FlowController {

    func start() {
        let vc = Resources.ViewControllers.App.debug(flow: self)

        tabBarItem.title = "DEBUG"
        tabBarItem.image = UIImage(systemName: "c.circle")

        navVC.viewControllers = [vc]
    }
}

// MARK: - Delegate

extension DEBUG_FlowController: DEBUG_ViewControllerDelegate {

    func didItemSelected(item: DEBUG_Item) {
        let viewController: UIViewController

        switch item {
            case .bottomSheetContent:
                viewController = Resources.ViewControllers.Debug.bottomSheetList()

            case .first:
                viewController = Resources.ViewControllers.App.first(flow: .init())

            case .firstDetail:
                viewController = Resources.ViewControllers.App.firstDetail()

            case .second:
                viewController = Resources.ViewControllers.App.second()
        }

        switch item {
            case .bottomSheetContent:
                navVC.present(viewController, animated: true)

            default:
                navVC.pushViewController(viewController, animated: true)
        }
    }
}
