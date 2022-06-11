import Foundation

public struct SampleDeleteRequest: Request {
    public typealias Parameters = EmptyParameters
    public typealias Response = EmptyResponse

    private let id: Int

    // requirements
    public var path: String { "/posts/\(id)" }
    public var method: HTTPMethod { .delete }
    public let parameters: Parameters

    // options
    public var queryItems: [URLQueryItem]?
    public var body: Data?

    // test
    public var testDataPath: URL? { nil }

    public init(parameters: Parameters = .init(), pathComponent id: Int) {
        self.parameters = parameters
        self.id = id
    }
}
