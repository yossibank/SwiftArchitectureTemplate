import Data

public struct AppError: Error, Equatable {
    private let error: APIError

    public init(error: APIError) {
        self.error = error
    }
}
