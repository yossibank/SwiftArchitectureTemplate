import Foundation

public struct SamplePutRequest: Request {

    public typealias Response = SampleResponse

    public struct Parameters: Codable {
        let userId: Int
        let id: Int
        let title: String
        let body: String
    }

    private let id: Int

    public let parameters: Parameters
    public var queryItems: [URLQueryItem]?
    public var method: HTTPMethod { .put }
    public var path: String { "/posts/\(id)" }

    public var testDataPath: URL? {
        Bundle.module.url(forResource: "PutSample", withExtension: "json")
    }

    public init(
        parameters: Parameters,
        pathComponent id: Int
    ) {
        self.parameters = parameters
        self.id = id
    }
}
