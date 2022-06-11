import Combine
import UIKit

// MARK: - stored properties

final class LoginUI {
    lazy var buttonTapPublisher: UIControl.Publisher<UIButton> = {
        button.publisher(for: .touchUpInside)
    }()

    private let button: UIButton = .init(style: .login)
}

// MARK: - protocol

extension LoginUI: UserInterface {
    func setupView(rootView: UIView) {
        rootView.backgroundColor = .systemBackground

        rootView.addSubViews(
            button,

            constraints:
            button.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: rootView.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 100)
        )
    }
}
