import UIKit

enum Tabs: Int, CaseIterable {
    case first
    case second
    case debug

    private var title: String {
        switch self {
            case .first:
                return "FIRST"

            case .second:
                return "SECOND"

            case .debug:
                return "DEBUG"
        }
    }

    private var image: UIImage? {
        switch self {
            case .first:
                return UIImage(systemName: "a.circle")

            case .second:
                return UIImage(systemName: "b.circle")

            case .debug:
                return UIImage(systemName: "c.circle")
        }
    }

    private var tabBarItem: UITabBarItem {
        .init(title: self.title, image: self.image, tag: self.rawValue)
    }

    private var baseViewController: UIViewController {
        let viewController: UIViewController

        switch self {
            case .first:
                viewController = Resources.ViewControllers.App.first()

            case .second:
                viewController = Resources.ViewControllers.App.second()

            case .debug:
                viewController = Resources.ViewControllers.App.debug()
        }

        let navVC = NavigationController(rootViewController: viewController)
        return navVC
    }

    var viewController: UIViewController {
        let viewController = baseViewController
        viewController.tabBarItem = tabBarItem
        return viewController
    }
}
