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
        rootView.addSubview(self.button)
        rootView.addSubview(self.someSwitch)
    }

    func setupLayout(rootView: UIView) {
        self.button.layout {
            $0.centerX == rootView.centerXAnchor
            $0.centerY == rootView.centerYAnchor
            $0.widthConstant == 100
            $0.heightConstant == 100
        }

        self.someSwitch.layout {
            $0.top == self.button.bottomAnchor + 10
            $0.centerX == rootView.centerXAnchor
        }
    }
}
