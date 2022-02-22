import UIKit

// MARK: - override methods

final class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - extension

extension UINavigationBar {

    func setupBackGroundColor(color: UIColor) {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = color
            standardAppearance = appearance
            scrollEdgeAppearance = appearance
        } else {
            barTintColor = color
        }
    }
}
