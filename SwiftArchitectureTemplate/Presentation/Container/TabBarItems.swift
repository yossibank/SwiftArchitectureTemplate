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

    private var tabBarItem: UITabBarItem {
        .init(title: self.title, image: nil, tag: self.rawValue)
    }

    private var baseViewController: UIViewController {
        let viewController: UIViewController

        switch self {
            case .first:
                viewController = FirstViewController.createInstance()

            case .second:
                viewController = SecondViewController.createInstance()

            case .debug:
                viewController = DEBUG_ViewController.createInstance()
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
