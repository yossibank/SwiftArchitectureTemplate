import Combine
import UIKit
import Utility

protocol FirstViewControllerDelegate: AnyObject {
    func didNextButtonTapped()
}

// MARK: - inject

extension FirstViewController: VCInjectable {
    typealias VM = FirstViewModel
    typealias UI = FirstUI
}

// MARK: - stored properties

final class FirstViewController: UIViewController {
    var viewModel: VM!
    var ui: UI!

    weak var delegate: FirstViewControllerDelegate!

    private var cancellables: Set<AnyCancellable> = []
}

// MARK: - override methods

extension FirstViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        ui.setupView(rootView: view)

        setupEvent()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        Analytics.shared.sendEvent()

        Logger.debug(message: "test")

        viewModel.viewWillAppear()
    }
}

// MARK: - private methods

private extension FirstViewController {
    func setupEvent() {
        ui.buttonTapPublisher.sink { [weak self] _ in
            self?.delegate.didNextButtonTapped()
        }
        .store(in: &cancellables)

        ui.someSwitchPublisher.sink { isOn in
            Logger.debug(message: "\(isOn)")
        }
        .store(in: &cancellables)

        viewModel.$state.sink { state in
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
        .store(in: &cancellables)
    }
}
