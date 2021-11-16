import Foundation

public struct SamplePostRequest: Request {

    public typealias Response = SampleResponse
    public typealias PathComponent = EmptyPathComponent

    public struct Parameters: Codable {
        let userId: Int
        let title: String
        let body: String
    }

    public let parameters: Parameters
    public var queryItems: [URLQueryItem]?
    public var method: HTTPMethod { .post }
    public var path: String { "/posts" }

    public var testDataPath: URL? {
        Bundle.module.url(forResource: "PostSample", withExtension: "json")
    }

    public init(
        parameters: Parameters,
        pathComponent _: EmptyPathComponent = .init()
    ) {
        self.parameters = parameters
    }
}
