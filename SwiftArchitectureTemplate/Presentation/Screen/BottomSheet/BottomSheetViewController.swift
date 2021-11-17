import UIKit

// MARK: - stored properties

final class BottomSheetViewController: UIViewController {

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

    private var contentView: UIView?

    private var dismissCallback: VoidBlock?

    init(dismissCallBack: VoidBlock? = nil) {
        self.dismissCallback = dismissCallBack
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.dismissCallback = nil
        super.init(coder: coder)
    }
}

// temporary

extension BottomSheetViewController {

    func configureNavigationBar() {}

    func setupView() {
        self.view.addSubview(containerView)
        self.view.addSubview(bottomSheetLineImageView)
        self.view.addSubview(baseView)
    }

    func setupLayout() {
        self.containerView.layout {
            $0.centerX == self.view.centerXAnchor
            $0.bottom == self.view.bottomAnchor
            $0.width == self.view.widthAnchor
            $0.height.lessThanOrEqual(to: self.view.heightAnchor)

            let heightConstant = containerView.heightAnchor.constraint(equalToConstant: 152)
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
            $0.bottom == self.view.bottomAnchor - 40
            $0.leading == self.containerView.leadingAnchor
            $0.trailing == self.containerView.trailingAnchor
        }
    }
}

// MARK: - override methods

extension BottomSheetViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()

        self.modalTransitionStyle = .coverVertical
        self.modalPresentationStyle = .formSheet

        if let view = contentView {
            baseView.addSubview(view)
            view.layout {
                $0.top == baseView.topAnchor
                $0.bottom == baseView.bottomAnchor
                $0.leading == baseView.leadingAnchor
                $0.trailing == baseView.trailingAnchor
            }
        }

        let gestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(viewTapped)
        )

        self.view.addGestureRecognizer(gestureRecognizer)

        presentationController?.delegate = self
    }
}

// MARK: - internal methods

extension BottomSheetViewController {

    func set(view: UIView) {
        self.contentView = view
    }
}

// MARK: - private methods

private extension BottomSheetViewController {

    @objc func viewTapped() {
        self.dismiss(animated: true) { [weak self] in
            self?.dismissCallback?()
        }
    }
}

// MARK: - delegate

extension BottomSheetViewController: UIAdaptivePresentationControllerDelegate {

    func presentationControllerDidDismiss(_: UIPresentationController) {
        self.dismiss(animated: true) { [weak self] in
            self?.dismissCallback?()
        }
    }
}
