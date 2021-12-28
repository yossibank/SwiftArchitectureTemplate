import UIKit

extension Resources {

    static var ViewControllers: ViewController {
        ViewController()
    }

    struct ViewController {

        var App: AppControllers {
            AppControllers()
        }

        var Debug: DebugControllers {
            DebugControllers()
        }

        struct AppControllers {

            func bottomSheet(dismissCallBack: VoidBlock? = nil) -> BottomSheetViewController {
                let instance = BottomSheetViewController(dismissCallBack: dismissCallBack)
                instance.inject(ui: BottomSheetUI())
                return instance
            }

            func debug() -> DEBUG_ViewController {
                let instance = DEBUG_ViewController()
                instance.inject(ui: DEBUG_UI())
                return instance
            }

            func first(flow: FirstFlowController) -> FirstViewController {
                let instance = FirstViewController()
                instance.inject(
                    viewModel: FirstViewModel(),
                    ui: FirstUI()
                )
                instance.title = "FIRST"
                instance.delegate = flow
                return instance
            }

            func firstDetail() -> FirstDetailViewController {
                let instance = FirstDetailViewController()
                instance.inject()
                return instance
            }

            func second() -> SecondViewController {
                let instance = SecondViewController()
                instance.inject(viewModel: SecondViewModel(), ui: SecondUI())
                instance.title = "SECOND"
                return instance
            }
        }

        struct DebugControllers {

            func bottomSheetList() -> DEBUG_BottomSheetListViewController {
                let instance = DEBUG_BottomSheetListViewController()
                instance.inject(ui: DEBUG_BottomSheetListUI())
                return instance
            }
        }
    }
}
