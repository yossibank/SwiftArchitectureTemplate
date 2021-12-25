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
            self.button,
            self.someSwitch,

            constraints:
            self.button.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            self.button.centerYAnchor.constraint(equalTo: rootView.centerYAnchor),
            self.button.widthAnchor.constraint(equalToConstant: 100),
            self.button.heightAnchor.constraint(equalToConstant: 100),

            self.someSwitch.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            self.someSwitch.topAnchor.constraint(equalTo: self.button.bottomAnchor, constant: 10)
        )
    }
}
