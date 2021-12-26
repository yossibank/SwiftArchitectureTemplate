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

    func setupNavigationBar(
        navigationBar: UINavigationBar?,
        navigationItem: UINavigationItem?
    ) {
        navigationBar?.setupBackGroundColor(color: .random)
        navigationItem?.title = "HOGEHOGE"
    }

    func setupView(rootView: UIView) {
        rootView.backgroundColor = .white

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
