import Combine
import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLoginButtonTapped()
}

extension LoginViewController: VCInjectable {
    typealias VM = NoViewModel
    typealias UI = LoginUI
}

// MARK: - stored properties

final class LoginViewController: UIViewController {

    var viewModel: VM!
    var ui: UI!

    weak var delegate: LoginViewControllerDelegate!

    private var cancellables: Set<AnyCancellable> = []
}

// MARK: - override methods

extension LoginViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupEvent()
    }
}

// MARK: - private methods

private extension LoginViewController {

    func setupUI() {
        ui.setupView(rootView: view)
    }

    func setupEvent() {
        ui.buttonTapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            AppDataHolder.isLogin = true
            self.delegate.didLoginButtonTapped()
        }
        .store(in: &cancellables)
    }
}
