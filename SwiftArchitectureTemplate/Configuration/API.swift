struct API {

    static var baseURL: String {
        let domain: String = try! Configuration.value(for: "API_DOMAIN_URL")
        return "https://" + domain
    }
}
