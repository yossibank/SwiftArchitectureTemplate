import Combine
import Domain
import Utility

final class FirstViewModel: ViewModel {
    typealias State = LoadingState<[SampleEntity], AppError>

    @Published private(set) var state: State = .standby

    private let usecase: FetchSampleUsecase

    private var cancellables: Set<AnyCancellable> = []

    init(usecase: FetchSampleUsecase = Domain.Usecase.FetchSample()) {
        self.usecase = usecase
    }
}

// MARK: - internal methods

extension FirstViewModel {
    func viewWillAppear() {
        state = .loading

        usecase.execute().sink { [weak self] completion in
            switch completion {
                case let .failure(error):
                    Logger.debug(message: error.localizedDescription)
                    self?.state = .failed(.init(error: error))

                case .finished:
                    Logger.debug(message: "finished")
            }
        } receiveValue: { [weak self] state in
            self?.state = .done(state)
        }
        .store(in: &cancellables)
    }
}
