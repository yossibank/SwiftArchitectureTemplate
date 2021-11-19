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

            func bottomSheet(dismissCallBack: VoidBlock? = nil) -> BottomSheetViewController {
                let instance = BottomSheetViewController(dismissCallBack: dismissCallBack)
                instance.inject(ui: BottomSheetUI())
                return instance
            }

            func debug() -> DEBUG_ViewController {
                let instance = DEBUG_ViewController()
                instance.inject(routing: DEBUG_Routing(), ui: DEBUG_UI())
                return instance
            }

            func first() -> FirstViewController {
                let instance = FirstViewController()
                instance.inject(
                    routing: FirstRouting(),
                    viewModel: FirstViewModel(),
                    ui: FirstUI()
                )
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
                return instance
            }
        }
    }
}
