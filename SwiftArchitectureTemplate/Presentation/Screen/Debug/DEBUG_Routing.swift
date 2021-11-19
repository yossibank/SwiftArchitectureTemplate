import UIKit

final class DEBUG_Routing: Routing {
    weak var viewController: UIViewController?
}

extension DEBUG_Routing {

    func showDebugView(item: DEBUG_UI.ItemKind) {
        let view: UIView

        switch item {
            case .bottomSheetContent:
                view = CommonBottomSheetContentView()

                if let bottomSheetView = view as? CommonBottomSheetContentView {
                    bottomSheetView.set(
                        title: "DEBUG TITLE",
                        body: "DEBUG BODY",
                        actions: [
                            .init(title: "DEFAULT", style: .default, handler: {}),
                            .init(title: "CANCEL", style: .cancel, handler: {}),
                            .init(title: "ALERT", style: .alert, handler: {})
                        ]
                    )
                }

                self.viewController?.showBottomSheet(view: view)

            default:
                view = UIView()
        }
    }

    func showDebugViewController(item: DEBUG_UI.ItemKind) {
        let viewController: UIViewController

        switch item {
            case .bottomSheet:
                viewController = Resources.ViewControllers.App.bottomSheet()
                viewController.view.backgroundColor = .lightGray

            case .first:
                viewController = Resources.ViewControllers.App.first()

            case .firstDetail:
                viewController = Resources.ViewControllers.App.firstDetail()

            case .second:
                viewController = Resources.ViewControllers.App.second()

            default:
                viewController = UIViewController()
        }

        self.viewController?.navigationController?.pushViewController(
            viewController,
            animated: true
        )
    }
}
