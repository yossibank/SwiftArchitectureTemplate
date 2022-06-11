import UIKit

// MARK: - received event app delegate

protocol AppFlowControllerDelegate: AnyObject {
    func didChangeThemeSelected(value: Int)
}

// MARK: - stored properties & init

final class AppFlowController: UIViewController {
    private let mainFlowController = MainFlowController()
    private let loginFlowController = LoginFlowController()

    weak var delegate: AppFlowControllerDelegate!

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

        if AppDataHolder.isLogin ?? false {
            add(mainFlowController)
            mainFlowController.delegate = self
            mainFlowController.start()
        } else {
            add(loginFlowController)
            loginFlowController.delegate = self
            loginFlowController.start()
        }
    }
}

// MARK: - delegate

extension AppFlowController: MainFlowControllerDelegate {
    func didChangeThemeSelected(value: Int) {
        delegate.didChangeThemeSelected(value: value)
    }
}

extension AppFlowController: LoginFlowControllerDelegate {
    func didLoginButtonTapped() {
        AppDataHolder.isLogin = true
        start()
    }
}
