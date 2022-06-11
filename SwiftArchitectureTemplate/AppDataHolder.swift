import Utility

struct AppDataHolder {
    @UserDefaultsStorage(key: AppDataHolderKey.isLogin.rawValue, defaultValue: false)
    static var isLogin: Bool

    @UserDefaultsStorage(key: AppDataHolderKey.colorTheme.rawValue, defaultValue: 0)
    static var colorTheme: Int
}
