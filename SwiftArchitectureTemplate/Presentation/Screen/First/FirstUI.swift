import UIKit

// MARK: - stored properties

final class FirstUI {

    let button: UIButton = .init(
        style: .someStyle,
        title: Resources.Strings.Button.nextTitle
    )

    let someSwitch: UISwitch = .init()
}

// MARK: - protocol

extension FirstUI: UserInterface {

    func configureNavigationBar(viewController: UIViewController) {
        viewController.title = "FIRST"
    }

    func setupView(rootView: UIView) {
        rootView.backgroundColor = .white
    }

    func setupLayout(rootView: UIView) {
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
