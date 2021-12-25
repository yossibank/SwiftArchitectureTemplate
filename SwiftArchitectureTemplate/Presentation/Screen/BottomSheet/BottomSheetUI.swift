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
        self.baseView.addSubViews(
            view,

            constraints:
            view.topAnchor.constraint(equalTo: self.baseView.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.baseView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.baseView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.baseView.trailingAnchor)
        )
    }
}

// MARK: - protocol

extension BottomSheetUI: UserInterface {

    func configureNavigationBar(viewController _: UIViewController) {}

    func setupView(rootView _: UIView) {}

    func setupLayout(rootView: UIView) {
        rootView.addSubViews(
            self.containerView,
            self.bottomSheetLineImageView,
            self.baseView,

            constraints:
            self.containerView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor),
            self.containerView.widthAnchor.constraint(equalTo: rootView.widthAnchor),
            self.containerView.heightAnchor.constraint(lessThanOrEqualTo: rootView.heightAnchor),

            self.bottomSheetLineImageView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
            self.bottomSheetLineImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 12),
            self.bottomSheetLineImageView.widthAnchor.constraint(equalToConstant: 30),
            self.bottomSheetLineImageView.heightAnchor.constraint(equalToConstant: 5),

            self.baseView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
            self.baseView.topAnchor.constraint(equalTo: self.bottomSheetLineImageView.bottomAnchor, constant: 16),
            self.baseView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -40),
            self.baseView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.baseView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor)
        )
    }
}
