import UIKit

// MARK: - stored properties

final class SecondUI {

    private let button: UIButton = .init(
        style: .someStyle,
        title: Resources.Strings.Button.cancelButtonTitle
    )
}

// MARK: - protocol

extension SecondUI: UserInterface {

    func setupNavigationBar(
        navigationBar: UINavigationBar?,
        navigationItem _: UINavigationItem?
    ) {
        navigationBar?.setupBackGroundColor(color: .random)
    }

    func setupView(rootView: UIView) {
        rootView.backgroundColor = .white

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