import Data

public struct APPError: Error, Equatable {

    private let error: APIError

    public init(error: APIError) {
        self.error = error
    }
}
