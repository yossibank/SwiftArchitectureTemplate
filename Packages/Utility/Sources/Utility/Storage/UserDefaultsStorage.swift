import Foundation

@propertyWrapper
public class UserDefaultsStorage<T: Equatable> {
    private let key: String
    private let defaultValue: T

    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            if newValue == defaultValue {
                UserDefaults.standard.removeObject(forKey: key)
                return
            }
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
