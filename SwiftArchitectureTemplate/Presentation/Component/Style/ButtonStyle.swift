import UIKit

extension Stylable where Self == UIButton {
    init(
        style: ViewStyle<Self>,
        title: String,
        for state: UIControl.State = .normal
    ) {
        self.init()
        setTitle(title, for: state)
        apply(style)
    }
}

extension ViewStyle where T: UIButton {
    static var someStyle: ViewStyle<T> {
        ViewStyle<T> {
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .random
            $0.layer.cornerRadius = 4.0
        }
    }

    static var bottomSheetDefaultStyle: ViewStyle<T> {
        ViewStyle<T> {
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
        ViewStyle<T> {
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
        ViewStyle<T> {
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
}
