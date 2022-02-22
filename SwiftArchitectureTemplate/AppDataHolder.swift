import Utility

struct AppDataHolder {
    @UserDefaultsStorage(key: "is_Login")
    static var isLogin: Bool?
}
