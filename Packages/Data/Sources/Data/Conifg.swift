public enum DataConfig {
    static var baseURL: String = ""

    public static func setup(baseURL: String) {
        self.baseURL = baseURL
    }
}
