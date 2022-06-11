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

        present(
            bottomSheetVC,
            animated: true,
            completion: completion
        )
    }

    func showBottomSheet(
        title: String?,
        body: String?,
        actions: [BottomSheetAction],
        dismissCallBack: VoidBlock? = nil,
        completion: VoidBlock? = nil
    ) {
        let commonBottomSheetView = CommonBottomSheetContentView()
        commonBottomSheetView.set(
            title: title,
            body: body,
            actions: actions
        )

        let bottomSheetVC = Resources.ViewControllers.App.bottomSheet(
            dismissCallBack: dismissCallBack
        )
        bottomSheetVC.set(view: commonBottomSheetView)

        present(
            bottomSheetVC,
            animated: true,
            completion: completion
        )
    }
}
