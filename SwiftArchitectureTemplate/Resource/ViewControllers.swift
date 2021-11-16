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

            func debug() -> DEBUG_ViewController {
                let instance = DEBUG_ViewController()
                instance.inject()
                return instance
            }
        }
    }
}
