import Combine
import CombineCocoa
import UIKit

struct ButtonSheetAction {
    var title: String
    var style: ButtonStyle
    var handler: VoidBlock
}

extension ButtonSheetAction {

    enum ButtonStyle: CaseIterable {
        case `default`
        case cancel
        case alert

        var type: ViewStyle<UIButton> {
            switch self {
                case .default:
                    return .bottomSheetDefaultStyle

                case .cancel:
                    return .bottomSheetCanceltStyle

                case .alert:
                    return .bottomSheetAlertStyle
            }
        }
    }
}

final class CommonBottomSheetContentView: UIView {

    private let baseStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 24
        return stackView
    }()

    private let titleLabelBackView = UIView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    private let messageBodyLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 18)
        return label
    }()

    private lazy var buttonContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 16
        self.baseStackView.addArrangedSubview(stackView)
        return stackView
    }()

    private var cancellables: Set<AnyCancellable> = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
        self.setupLayout()
    }
}

// MARK: - internal methods

extension CommonBottomSheetContentView {

    func set(
        title: String?,
        body: String?,
        actions: [ButtonSheetAction]
    ) {
        self.configureTitleLabel(title: title)
        self.configureMessageBodyLabel(body: body)
        self.configureButtons(actions)
    }
}

// MARK: - private methods

private extension CommonBottomSheetContentView {

    func setupView() {
        addSubview(self.baseStackView)
        self.titleLabelBackView.addSubview(self.titleLabel)

        let stackViews = [
            titleLabelBackView,
            messageBodyLabel
        ]

        stackViews.forEach {
            self.baseStackView.addArrangedSubview($0)
        }
    }

    func setupLayout() {
        self.baseStackView.layout {
            $0.top == self.topAnchor
            $0.bottom == self.bottomAnchor
            $0.leading == self.leadingAnchor + 32
            $0.trailing == self.trailingAnchor - 32
        }

        self.titleLabel.layout {
            $0.top == self.titleLabelBackView.topAnchor
            $0.bottom == self.titleLabelBackView.bottomAnchor - 8
            $0.leading == self.titleLabelBackView.leadingAnchor
            $0.trailing == self.titleLabelBackView.trailingAnchor
            $0.heightConstant == 28
        }
    }

    func configureTitleLabel(title: String?) {
        if let title = title {
            self.titleLabel.text = title
            self.titleLabelBackView.isHidden = false
        } else {
            self.titleLabelBackView.isHidden = true
        }
    }

    func configureMessageBodyLabel(body: String?) {
        if let body = body {
            self.messageBodyLabel.text = body
            self.messageBodyLabel.isHidden = false
        } else {
            self.messageBodyLabel.isHidden = true
        }
    }

    func configureButtons(_ actions: [ButtonSheetAction]) {
        actions.map { makeButton(by: $0) }.forEach {
            self.buttonContainerStackView.addArrangedSubview($0)
            $0.layout { $0.heightConstant == 52 }
        }
    }

    func makeButton(by action: ButtonSheetAction) -> UIButton {
        let button = UIButton(style: action.style.type)
        button.setTitle(action.title, for: .normal)
        button.tapPublisher.sink { _ in
            action.handler()
        }
        .store(in: &self.cancellables)

        return button
    }
}
