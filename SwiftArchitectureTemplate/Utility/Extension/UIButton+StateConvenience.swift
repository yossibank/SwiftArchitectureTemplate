import UIKit

extension UIButton {

    var normalTitleColor: UIColor? {
        get {
            titleColor(for: .normal)
        }
        set {
            setTitleColor(newValue, for: .normal)
        }
    }

    var highlightedTitleColor: UIColor? {
        get {
            titleColor(for: .highlighted)
        }
        set {
            setTitleColor(newValue, for: .highlighted)
        }
    }

    var disabledTitleColor: UIColor? {
        get {
            titleColor(for: .disabled)
        }
        set {
            setTitleColor(newValue, for: .disabled)
        }
    }

    var selectedTitleColor: UIColor? {
        get {
            titleColor(for: .selected)
        }
        set {
            setTitleColor(newValue, for: .selected)
        }
    }

    var focusedTitleColor: UIColor? {
        get {
            titleColor(for: .focused)
        }
        set {
            setTitleColor(newValue, for: .focused)
        }
    }
}
