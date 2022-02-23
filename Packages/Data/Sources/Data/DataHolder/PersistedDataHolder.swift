import Utility

struct PersistedDataHolder {
    @UserDefaultsStorage(key: UserDefaultKey.onboardingFinished)
    static var onboardingFinished: Bool?

    @FileStorage(fileName: FileName.someFile.rawValue)
    static var someData: [String]?
}
