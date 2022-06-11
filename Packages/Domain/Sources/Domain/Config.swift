import Data

public enum DomainConfig {
    public static func setup(baseURL: String) {
        DataConfig.setup(baseURL: baseURL)
    }
}
