import UIKit

extension TabBarController: VCInjectable {
    typealias R = NoRouting
    typealias VM = NoViewModel
    typealias UI = NoUserInterface
}

// MARK: - stored properties

final class TabBarController: UITabBarController {
    var routing: R!
    var viewModel: VM!
    var ui: UI!
}

// MARK: - override methods

extension TabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.inject()
        self.setViewControllers(
            Tabs.allCases.map { $0.viewController },
            animated: false
        )
    }
}
