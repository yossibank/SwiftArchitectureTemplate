import Utility

struct AppDataHolder {
    @UserDefaultsStorage(key: "is_Login")
    static var isLogin: Bool?

    @UserDefaultsStorage(key: "color_theme")
    static var colorTheme: Int?
}
