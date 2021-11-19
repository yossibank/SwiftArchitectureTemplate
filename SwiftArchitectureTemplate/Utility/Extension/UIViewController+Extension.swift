import UIKit

extension UIViewController {

    func showBottomSheet(
        view: UIView,
        dismissCallBack: VoidBlock? = nil,
        completion: VoidBlock? = nil
    ) {
        let bottomSheetVC = Resources.ViewControllers.App.bottomSheet(
            dismissCallBack: dismissCallBack
        )
        bottomSheetVC.set(view: view)

        self.present(
            bottomSheetVC,
            animated: true,
            completion: completion
        )
    }
}
