import Combine
import UIKit

// MARK: - stored properties

final class FirstUI {

    private let button: UIButton = .init(
        style: .someStyle,
        title: Resources.Strings.Button.nextTitle
    )

    private let someSwitch: UISwitch = .init()

    lazy var buttonTapPublisher: UIControl.Publisher<UIButton> = {
        button.publisher(for: .touchUpInside)
    }()

    lazy var someSwitchPublisher: AnyPublisher<Bool, Never> = {
        someSwitch.isOnPublisher
    }()
}

// MARK: - protocol

extension FirstUI: UserInterface {

    func setupView(rootView: UIView) {
        rootView.backgroundColor = .systemBackground

        rootView.addSubViews(
            button,
            someSwitch,

            constraints:
            button.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: rootView.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 100),

            someSwitch.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            someSwitch.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10)
        )
    }
}
