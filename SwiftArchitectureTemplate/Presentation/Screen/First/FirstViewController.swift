import Combine
import UIKit
import Utility

extension FirstViewController: VCInjectable {
    typealias R = FirstRouting
    typealias VM = FirstViewModel
    typealias UI = FirstUI
}

// MARK: - stored properties

final class FirstViewController: UIViewController {

    var routing: R! { didSet { self.routing.viewController = self } }
    var viewModel: VM!
    var ui: UI!

    private var cancellables: Set<AnyCancellable> = []
}

// MARK: - override methods

extension FirstViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupEvent()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        Analytics.shared.sendEvent()

        Logger.debug(message: "test")

        self.viewModel.viewWillAppear()
    }
}

// MARK: - private methods

private extension FirstViewController {

    func setupUI() {
        self.ui.configureNavigationBar(viewController: self)
        self.ui.setupView(rootView: self.view)
        self.ui.setupLayout(rootView: self.view)
    }

    func setupEvent() {
        self.ui.button.publisher(for: .touchUpInside).sink { [weak self] _ in
            guard let self = self else { return }
            self.routing.showDetail()
        }
        .store(in: &self.cancellables)

        self.ui.someSwitch.isOnPublisher.sink { isOn in
            Logger.debug(message: "\(isOn)")
        }
        .store(in: &self.cancellables)

        self.viewModel.$state.sink { state in
            Logger.debug(message: "\(state)")

            switch state {
                case .standby:
                    Logger.debug(message: "standby")

                case .loading:
                    Logger.debug(message: "loading")

                case let .done(entities):
                    Logger.debug(message: "\(entities)")

                case let .failed(error):
                    Logger.debug(message: "\(error.localizedDescription)")
            }
        }
        .store(in: &self.cancellables)
    }
}

