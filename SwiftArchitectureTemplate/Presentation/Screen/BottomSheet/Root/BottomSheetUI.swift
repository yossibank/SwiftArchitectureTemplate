import UIKit

// MARK: - stored properties

final class BottomSheetUI {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16.0
        view.layer.masksToBounds = true
        return view
    }()

    private let bottomSheetLineImageView: UIImageView = .init(
        image: Resources.Images.General.bottomSheetBar
    )

    private let baseView = UIView()
}

// MARK: - internal methods

extension BottomSheetUI {

    func set(view: UIView) {
        baseView.addSubViews(
            view,

            constraints:
            view.topAnchor.constraint(equalTo: baseView.topAnchor),
            view.bottomAnchor.constraint(equalTo: baseView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: baseView.trailingAnchor)
        )
    }
}

// MARK: - protocol

extension BottomSheetUI: UserInterface {

    func setupView(rootView: UIView) {
        rootView.addSubViews(
            containerView,
            bottomSheetLineImageView,
            baseView,

            constraints:
            containerView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            containerView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: rootView.widthAnchor),
            containerView.heightAnchor.constraint(lessThanOrEqualTo: rootView.heightAnchor),

            bottomSheetLineImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            bottomSheetLineImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            bottomSheetLineImageView.widthAnchor.constraint(equalToConstant: 30),
            bottomSheetLineImageView.heightAnchor.constraint(equalToConstant: 5),

            baseView.topAnchor.constraint(equalTo: bottomSheetLineImageView.bottomAnchor, constant: 16),
            baseView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -40),
            baseView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        )
    }
}
