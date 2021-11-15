import Foundation

public struct SampleDeleteRequest: Request {

    public typealias Parameters = EmptyParameters
    public typealias Response = EmptyResponse

    private let id: Int

    public let parameters: Parameters
    public var queryItems: [URLQueryItem]?
    public var method: HTTPMethod { .delete }
    public var path: String { "/posts/\(self.id)" }
    public var body: Data?

    public var testDataPath: URL? { nil }

    public init(
        parameters: Parameters = .init(),
        pathComponent id: Int
    ) {
        self.parameters = parameters
        self.id = id
    }
}
