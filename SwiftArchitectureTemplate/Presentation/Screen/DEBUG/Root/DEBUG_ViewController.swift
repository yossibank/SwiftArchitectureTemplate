#if DEBUG

import Combine
import UIKit

protocol DEBUG_ViewControllerDelegate: AnyObject {
    func didDevelopmentSelected(item: DEBUG_Development)
    func didComponentSelected(item: DEBUG_Component)
    func didControllerSelected(item: DEBUG_Controller)
    func didChangeThemeSelected(value: Int)
}

// MARK: - inject

extension DEBUG_ViewController: VCInjectable {
    typealias VM = NoViewModel
    typealias UI = DEBUG_UI
}

// MARK: - stored properties

final class DEBUG_ViewController: UIViewController {
    var viewModel: VM!
    var ui: UI!

    weak var delegate: DEBUG_ViewControllerDelegate!

    private var cancellables: Set<AnyCancellable> = []
}

// MARK: - override methods

extension DEBUG_ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ui.injectDelegate(self)
        ui.setupView(rootView: view)
        ui.setupTableView(delegate: self)
    }
}

// MARK: - delegate

extension DEBUG_ViewController: UITableViewDelegate {

    func tableView(
        _: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let header = UITableViewHeaderFooterView()
        let section = DEBUG_Section.allCases[section]

        if #available(iOS 14.0, *) {
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .gray
            header.backgroundConfiguration = backgroundConfig
        } else {
            header.contentView.backgroundColor = .gray
        }

        header.textLabel?.textColor = .white
        header.textLabel?.text = section.rawValue.uppercased()
        return header
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(
            at: indexPath,
            animated: true
        )

        let section = DEBUG_Section.allCases[indexPath.section]

        switch section {
            case .development:
                let item = DEBUG_Development.allCases[indexPath.row]
                delegate.didDevelopmentSelected(item: item)

            case .component:
                let item = DEBUG_Component.allCases[indexPath.row]
                delegate.didComponentSelected(item: item)

            case .viewController:
                let item = DEBUG_Controller.allCases[indexPath.row]
                delegate.didControllerSelected(item: item)
        }
    }
}

extension DEBUG_ViewController: DEBUG_UI_Delegate {

    func selectedThemeIndex(_ publisher: AnyPublisher<Int, Never>) {
        publisher.sink { [weak self] value in
            self?.delegate.didChangeThemeSelected(value: value)
        }
        .store(in: &cancellables)
    }
}

#endif
