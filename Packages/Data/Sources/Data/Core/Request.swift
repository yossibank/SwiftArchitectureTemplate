import Foundation

public struct EmptyParameters: Encodable, Equatable {
    public init() {}
}

public struct EmptyResponse: Codable, Equatable {
    public init() {}
}

public struct EmptyPathComponent {
    public init() {}
}

enum APIRequestHeader: String, CaseIterable {
    case contentType = "Content-Type"

    var value: String? {
        switch self {
            case .contentType:
                return "application/json"
        }
    }
}

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case trace = "TRACE"
    case connect = "CONNECT"
}

struct HTTPStatusCode {
    static let noContent: Int = 204
    static let successRange: ClosedRange<Int> = 200...299
    static let unauthorized: Int = 401
    static let notFound: Int = 404
    static let unprocessableEntity: Int = 422
}

public protocol Request {
    associatedtype Response: Decodable
    associatedtype Parameters: Encodable
    associatedtype PathComponent

    var headers: [String: String] { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
    var baseURL: String { get }
    var path: String { get }
    var wantCache: Bool { get }
    var localDataInterceptor: (Parameters) -> Response? { get }
    var successHandler: (Response) -> Void { get }
    var failureHandler: (Error) -> Void  { get }

    #if DEBUG
    var testDataPath: URL? { get }
    #endif

    init(
        parameters: Parameters,
        pathComponent: PathComponent
    )
}

public extension Request {

    var baseURL: String {
        DataConfig.baseURL
    }

    var queryItems: [URLQueryItem]? {
        let query: [URLQueryItem]

        if let p = parameters as? [Encodable] {
            query = p.flatMap { param in param.dictionary.map { key, value in
                URLQueryItem(name: key, value: value?.description ?? "")
            }}
        } else {
            query = parameters.dictionary.map { key, value in
                URLQueryItem(name: key, value: value?.description ?? "")
            }
        }

        return query.sorted { first, second in
            first.name < second.name
        }
    }

    var body: Data? {
        try? JSONEncoder().encode(parameters)
    }

    var headers: [String: String] {
        var ret: [String: String] = [:]

        APIRequestHeader.allCases.forEach { header in
            ret[header.rawValue] = header.value
        }

        return ret
    }

    var wantCache: Bool { false }

    var localDataInterceptor: (Parameters) -> Response? {{ _ in nil }}

    var successHandler: (Response) -> Void {{ _ in }}

    var failureHandler: (Error) -> Void {{ _ in }}
}

private extension Encodable {

    var dictionary: [String: CustomStringConvertible?] {
        (
            try? JSONSerialization.jsonObject(
                with: JSONEncoder().encode(self)
            )
        ) as? [String: CustomStringConvertible?] ?? [:]
    }
}
