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

// MARK: - protocol

extension DEBUG_FlowController: FlowController {

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
        switch item {
            case .bottomSheetContent:
                let vc = Resources.ViewControllers.Debug.bottomSheetList()
                navVC.present(vc, animated: true)

            case .first:
                let flow = FirstFlowController()
                flow.start()
                navVC.pushViewController(flow, animated: true)

            case .firstDetail:
                let vc = Resources.ViewControllers.App.firstDetail()
                navVC.pushViewController(vc, animated: true)

            case .second:
                let vc = Resources.ViewControllers.App.second()
                navVC.pushViewController(vc, animated: true)
        }
    }
}
