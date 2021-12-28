import UIKit

// MARK: - Stored Properties & Init

final class AppFlowController: UIViewController {

    private let mainFlowController = MainFlowController()
    private let loginFlowController = LoginFlowController()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - override methods

extension AppFlowController {

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        children.first?.view.frame = view.bounds
    }
}

// MARK: - protocol

extension AppFlowController: FlowController {

    func start() {
        removeFirstChild()

        if true {
            add(mainFlowController)
            mainFlowController.start()
        } else {
            add(loginFlowController)
            loginFlowController.start()
        }
    }
}
