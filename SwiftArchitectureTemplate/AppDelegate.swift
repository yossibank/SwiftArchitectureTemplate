import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private lazy var appFlowController: AppFlowController = {
        let controller = AppFlowController()
        controller.delegate = window
        return controller
    }()

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        PackageConfig.setup()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appFlowController
        window?.settingTheme()
        window?.makeKeyAndVisible()
        appFlowController.start()

        return true
    }
}

extension UIWindow: AppFlowControllerDelegate {
    func didChangeThemeSelected(value: Int) {
        guard let style = UIUserInterfaceStyle(rawValue: value) else {
            return
        }
        overrideUserInterfaceStyle = style
        AppDataHolder.colorTheme = value
    }

    func settingTheme() {
        guard let style = UIUserInterfaceStyle(rawValue: AppDataHolder.colorTheme ?? 0) else {
            return
        }
        overrideUserInterfaceStyle = style
    }
}
