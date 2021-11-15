import Combine
import Domain
import Utility

final class FirstViewModel: ViewModel {

    typealias State = LoadingState<[SampleEntity], AppError>

    private let usecase: SampleUsecase

    private var cancellables: Set<AnyCancellable> = []

    @Published private(set) var state: State = .standby

    init(usecase: SampleUsecase = Domain.Usecase.FetchSample()) {
        self.usecase = usecase
    }
}

// MARK: - internal method

extension FirstViewModel {

    func viewWillAppear() {
        self.state = .loading

        self.usecase.fetchSample().sink { [weak self] completion in
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
        .store(in: &self.cancellables)
    }
}
