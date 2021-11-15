import UIKit

final class FirstUI {

    let button: UIButton = .init(
        style: .someStyle,
        title: Strings.Button.nextTitle
    )

    let someSwitch: UISwitch = .init()
}

extension FirstUI: UserInterface {

    func configureNavigationBar(viewController: UIViewController) {
        viewController.title = "FIRST"
    }

    func setupView(rootView: UIView) {
        rootView.backgroundColor = .white
        rootView.addSubview(button)
        rootView.addSubview(someSwitch)
    }

    func setupLayout(rootView: UIView) {
        button.layout {
            $0.centerX == rootView.centerXAnchor
            $0.centerY == rootView.centerYAnchor
            $0.widthConstant == 100
            $0.heightConstant == 100
        }

        someSwitch.layout {
            $0.top == self.button.bottomAnchor
            $0.centerX == rootView.centerXAnchor
        }
    }
}
