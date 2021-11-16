import Domain
import Firebase
import Utility

struct PackageConfig {

    static func setup() {
        /* setup GoogleService-Info.Plist */
//        FirebaseApp.configure()
        DomainConfig.setup(baseURL: API.baseURL)
        UtilityConfig.setup(analytics: FirebaseProvider())
    }
}
