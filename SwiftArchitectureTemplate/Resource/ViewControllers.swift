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

            func login() -> LoginViewController {
                let instance = LoginViewController()
                instance.inject(ui: LoginUI())
                instance.title = "LOGIN"
                return instance
            }

            func first() -> FirstViewController {
                let instance = FirstViewController()
                instance.inject(viewModel: FirstViewModel(), ui: FirstUI())
                instance.title = "FIRST"
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

            func debug() -> DEBUG_ViewController {
                let instance = DEBUG_ViewController()
                instance.inject(ui: DEBUG_UI())
                instance.title = "DEBUG"
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
