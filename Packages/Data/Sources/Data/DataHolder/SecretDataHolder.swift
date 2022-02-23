import Utility

struct SecretDataHolder {
    @KeychainStorage(key: KeychainKey.accessToken)
    static var accessToken: String?
}
