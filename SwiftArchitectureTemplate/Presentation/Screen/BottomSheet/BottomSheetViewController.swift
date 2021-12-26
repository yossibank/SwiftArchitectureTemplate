import UIKit

extension BottomSheetViewController: VCInjectable {
    typealias R = NoRouting
    typealias VM = NoViewModel
    typealias UI = BottomSheetUI
}

// MARK: - stored properties

final class BottomSheetViewController: UIViewController {

    var routing: R!
    var viewModel: VM!
    var ui: UI!

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

// MARK: - override methods

extension BottomSheetViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        modalTransitionStyle = .coverVertical
        modalPresentationStyle = .formSheet

        setupUI()

        if let view = contentView {
            ui.set(view: view)
        }

        let gestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(viewTapped)
        )

        view.addGestureRecognizer(gestureRecognizer)

        presentationController?.delegate = self
    }
}

// MARK: - internal methods

extension BottomSheetViewController {

    func set(view: UIView) {
        contentView = view
    }
}

// MARK: - private methods

private extension BottomSheetViewController {

    func setupUI() {
        ui.setupView(rootView: view)
    }

    @objc func viewTapped() {
        dismiss(animated: true) { [weak self] in
            self?.dismissCallback?()
        }
    }
}

// MARK: - delegate

extension BottomSheetViewController: UIAdaptivePresentationControllerDelegate {

    func presentationControllerDidDismiss(_: UIPresentationController) {
        dismiss(animated: true) { [weak self] in
            self?.dismissCallback?()
        }
    }
}
