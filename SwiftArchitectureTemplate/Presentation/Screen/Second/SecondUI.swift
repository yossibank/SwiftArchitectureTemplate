import UIKit

// MARK: - stored properties

final class SecondUI {

    let button: UIButton = .init(
        style: .someStyle,
        title: Resources.Strings.Button.cancelButtonTitle
    )
}

// MARK: - protocol

extension SecondUI: UserInterface {

    func configureNavigationBar(viewController: UIViewController) {
        viewController.title = "SECOND"
    }

    func setupView(rootView: UIView) {
        rootView.backgroundColor = .white
    }

    func setupLayout(rootView: UIView) {
        rootView.addSubViews(
            self.button,

            constraints:
            self.button.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            self.button.centerYAnchor.constraint(equalTo: rootView.centerYAnchor),
            self.button.widthAnchor.constraint(equalToConstant: 100),
            self.button.heightAnchor.constraint(equalToConstant: 100)
        )
    }
}
