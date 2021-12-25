import UIKit

final class DEBUG_Routing: Routing {
    weak var viewController: UIViewController?
}

extension DEBUG_Routing {

    func showDebugScreen(item: DEBUG_UI.ItemKind) {
        let viewController: UIViewController

        switch item {
            case .bottomSheetContent:
                viewController = Resources.ViewControllers.Debug.bottomSheetList()

            case .first:
                viewController = Resources.ViewControllers.App.first()

            case .firstDetail:
                viewController = Resources.ViewControllers.App.firstDetail()

            case .second:
                viewController = Resources.ViewControllers.App.second()
        }

        switch item {
            case .bottomSheetContent:
                self.viewController?.present(viewController, animated: true)

            default:
                self.viewController?.navigationController?.pushViewController(
                    viewController,
                    animated: true
                )
        }
    }
}
