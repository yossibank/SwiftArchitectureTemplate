import UIKit

// MARK: - stored properties

final class BottomSheetUI {

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16.0
        view.layer.masksToBounds = true
        return view
    }()

    private let bottomSheetLineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resources.Images.General.bottomSheetBar
        return imageView
    }()

    private let baseView = UIView()
}

// MARK: - internal methods

extension BottomSheetUI {

    func set(view: UIView) {
        self.baseView.addSubview(view)
        view.layout {
            $0.top == self.baseView.topAnchor
            $0.bottom == self.baseView.bottomAnchor
            $0.leading == self.baseView.leadingAnchor
            $0.trailing == self.baseView.trailingAnchor
        }
    }
}

// MARK: - protocol

extension BottomSheetUI: UserInterface {

    func configureNavigationBar(viewController _: UIViewController) {}

    func setupView(rootView: UIView) {
        let viewList = [
            self.containerView,
            self.bottomSheetLineImageView,
            self.baseView
        ]

        viewList.forEach {
            rootView.addSubview($0)
        }
    }

    func setupLayout(rootView: UIView) {
        self.containerView.layout {
            $0.centerX == rootView.centerXAnchor
            $0.bottom == rootView.bottomAnchor
            $0.width == rootView.widthAnchor
            $0.height.lessThanOrEqual(to: rootView.heightAnchor)

            let heightConstant = self.containerView.heightAnchor.constraint(equalToConstant: 152)
            heightConstant.priority = .init(rawValue: 1)
            heightConstant.isActive = true
        }

        self.bottomSheetLineImageView.layout {
            $0.centerX == self.containerView.centerXAnchor
            $0.top == self.containerView.topAnchor + 12
            $0.widthConstant == 30
            $0.heightConstant == 5
        }

        self.baseView.layout {
            $0.centerX == self.containerView.centerXAnchor
            $0.top == self.bottomSheetLineImageView.bottomAnchor + 16
            $0.bottom == rootView.bottomAnchor - 40
            $0.leading == self.containerView.leadingAnchor
            $0.trailing == self.containerView.trailingAnchor
        }
    }
}
