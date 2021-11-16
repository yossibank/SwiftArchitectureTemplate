import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        PackageConfig.setup()

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = TabBarController()
        self.window?.makeKeyAndVisible()

        return true
    }
}
