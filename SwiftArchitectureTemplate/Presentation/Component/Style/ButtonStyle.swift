import UIKit

extension ViewStyle where T: UIButton {
    static var someStyle: ViewStyle<T> {
        .init {
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .random
            $0.layer.cornerRadius = 4.0
        }
    }

    static var bottomSheetDefaultStyle: ViewStyle<T> {
        .init {
            $0.titleLabel?.font = .systemFont(ofSize: 19)
            $0.layer.borderColor = Resources.Colors.borderColor.cgColor
            $0.layer.borderWidth = 1.0
            $0.backgroundColor = .black
            $0.normalTitleColor = .white
            $0.selectedTitleColor = .white
            $0.disabledTitleColor = .white
            $0.highlightedTitleColor = .white
            $0.focusedTitleColor = .white
        }
    }

    static var bottomSheetCanceltStyle: ViewStyle<T> {
        .init {
            $0.titleLabel?.font = .systemFont(ofSize: 19)
            $0.layer.borderColor = Resources.Colors.borderColor.cgColor
            $0.layer.borderWidth = 1.0
            $0.backgroundColor = .white
            $0.normalTitleColor = .black
            $0.selectedTitleColor = .black
            $0.disabledTitleColor = .lightGray
            $0.highlightedTitleColor = .black
            $0.focusedTitleColor = .black
        }
    }

    static var bottomSheetAlertStyle: ViewStyle<T> {
        .init {
            $0.titleLabel?.font = .systemFont(ofSize: 19)
            $0.layer.borderColor = Resources.Colors.borderColor.cgColor
            $0.layer.borderWidth = 1.0
            $0.backgroundColor = .red
            $0.normalTitleColor = .white
            $0.selectedTitleColor = .white
            $0.disabledTitleColor = .white
            $0.highlightedTitleColor = .white
            $0.focusedTitleColor = .white
        }
    }

    static var cancel: ViewStyle<T> {
        .init {
            $0.setTitle(Resources.Strings.Button.cancelButtonTitle, for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .random
            $0.layer.cornerRadius = 4.0
        }
    }

    static var next: ViewStyle<T> {
        .init {
            $0.setTitle(Resources.Strings.Button.nextTitle, for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .random
            $0.layer.cornerRadius = 4.0
        }
    }

    static var login: ViewStyle<T> {
        .init {
            $0.setTitle(Resources.Strings.Button.loginTitle, for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .random
            $0.layer.cornerRadius = 4.0
        }
    }
}
