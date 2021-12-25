import Combine
import Data

public protocol SampleUsecase {
    func fetchSample(userId: Int?) -> AnyPublisher<[SampleEntity], APIError>
}

public extension SampleUsecase {

    func fetchSample(userId: Int? = nil) -> AnyPublisher<[SampleEntity], APIError> {
        fetchSample(userId: userId)
    }
}

extension UsecaseImpl: SampleUsecase where R == Repos.Sample.Get, M == SampleMapper {

    public func fetchSample(
        userId: Int? = nil
    ) -> AnyPublisher<[SampleEntity], APIError> {
        toPublisher { promise in
            analytics.sendEvent()

            repository.request(
                useTestData: useTestData,
                parameters: .init(userId: userId),
                pathComponent: .init()
            ) { result in
                switch result {
                    case let .success(response):
                        let entity = mapper.convert(response: response)
                        promise(.success(entity))

                    case let .failure(error):
                        promise(.failure(error))
                }
            }
        }
    }
}
