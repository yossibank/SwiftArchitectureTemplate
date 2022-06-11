import Utility

struct PersistedDataHolder {
    @UserDefaultsStorage(key: AppDataHolderKey.onboardingFinished.rawValue, defaultValue: false)
    static var onboardingFinished: Bool

    @FileStorage(fileName: FileName.someFile.rawValue)
    static var someData: [String]?
}
