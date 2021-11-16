import UIKit

final class SecondUI {

    let button: UIButton = .init(
        style: .someStyle,
        title: Resources.Strings.Button.cancelButtonTitle
    )
}

extension SecondUI: UserInterface {

    func configureNavigationBar(viewController: UIViewController) {
        viewController.title = "SECOND"
    }

    func setupView(rootView: UIView) {
        rootView.backgroundColor = .white
        rootView.addSubview(button)
    }

    func setupLayout(rootView: UIView) {
        button.layout {
            $0.centerX == rootView.centerXAnchor
            $0.centerY == rootView.centerYAnchor
            $0.widthConstant == 100
            $0.heightConstant == 100
        }
    }
}
