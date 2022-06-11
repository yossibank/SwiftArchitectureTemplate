import Foundation

public struct SampleGetRequest: Request {
    public typealias Response = [SampleResponse]
    public typealias PathComponent = EmptyPathComponent

    public struct Parameters: Codable {
        let userId: Int?

        public init(userId: Int?) {
            self.userId = userId
        }
    }

    // requirements
    public var path: String { "/posts" }
    public var method: HTTPMethod { .get }
    public let parameters: Parameters

    // options
    public var body: Data?
    public var wantCache: Bool { true }

    // test
    public var testDataPath: URL? {
        Bundle.module.url(forResource: "GetSample", withExtension: "json")
    }

    public init(parameters: Parameters, pathComponent _: EmptyPathComponent = .init()) {
        self.parameters = parameters
    }
}
