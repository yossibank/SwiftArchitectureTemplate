import UIKit

extension Resources {

    static var ViewControllers: ViewController {
        ViewController()
    }

    struct ViewController {

        var App: AppControllers {
            AppControllers()
        }

        struct AppControllers {

            func first(flow: FirstFlowController) -> FirstViewController {
                let instance = FirstViewController()
                instance.inject(viewModel: FirstViewModel(), ui: FirstUI())
                instance.title = "FIRST"
                instance.delegate = flow
                return instance
            }

            func firstDetail() -> FirstDetailViewController {
                let instance = FirstDetailViewController()
                instance.inject()
                instance.title = "FIRST DETAIL"
                return instance
            }

            func second() -> SecondViewController {
                let instance = SecondViewController()
                instance.inject(viewModel: SecondViewModel(), ui: SecondUI())
                instance.title = "SECOND"
                return instance
            }

            func bottomSheet(dismissCallBack: VoidBlock? = nil) -> BottomSheetViewController {
                let instance = BottomSheetViewController(dismissCallBack: dismissCallBack)
                instance.inject(ui: BottomSheetUI())
                return instance
            }

            #if DEBUG

            func debug(flow: DEBUG_FlowController) -> DEBUG_ViewController {
                let instance = DEBUG_ViewController()
                instance.inject(ui: DEBUG_UI())
                instance.title = "DEBUG"
                instance.delegate = flow
                return instance
            }

            func debugBottomSheetList() -> DEBUG_BottomSheetListViewController {
                let instance = DEBUG_BottomSheetListViewController()
                instance.inject(ui: DEBUG_BottomSheetListUI())
                return instance
            }

            #endif
        }
    }
}
