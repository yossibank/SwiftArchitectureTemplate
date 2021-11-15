import UIKit

extension Stylable where Self == UIButton {

    init(
        style: ViewStyle<Self>,
        title: String,
        for state: UIControl.State = .normal
    ) {
        self.init()
        self.setTitle(title, for: state)
        self.apply(style)
    }
}

extension ViewStyle where T: UIButton {

    static var someStyle: ViewStyle<T> {
        ViewStyle<T> {
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .green
            $0.layer.cornerRadius = 4.0
        }
    }
}
