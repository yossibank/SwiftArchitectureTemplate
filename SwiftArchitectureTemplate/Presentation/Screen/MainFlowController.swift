import UIKit

// MARK: - stored properties & init

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

// MARK: - protocol

extension MainFlowController: FlowController {

    func start() {
        let flows: [FlowController]

        #if DEBUG
        flows = [FirstFlowController(), SecondFlowController(), DEBUG_FlowController()]
        #else
        flows = [FirstFlowController(), SecondFlowController()]
        #endif

        tabController.setViewControllers(flows, animated: false)

        flows.forEach { $0.start() }
    }
}
