import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainFlowController: MainFlowController!

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        PackageConfig.setup()

        mainFlowController = MainFlowController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainFlowController
        window?.makeKeyAndVisible()
        mainFlowController.start()

        return true
    }
}
