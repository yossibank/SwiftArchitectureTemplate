import UIKit

extension DEBUG_ViewController: VCInjectable {
    typealias VM = NoViewModel
    typealias UI = DEBUG_UI
}

// MARK: - stored properties

final class DEBUG_ViewController: UIViewController {
    var viewModel: VM!
    var ui: UI!
}

// MARK: - override methods

extension DEBUG_ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
}

// MARK: - private methods

private extension DEBUG_ViewController {

    func setupUI() {
        ui.setupView(rootView: view)
    }

    func setupTableView() {
        ui.setupTableView(delegate: self)
        ui.loadTableItems()
    }
}

// MARK: - delegate

extension DEBUG_ViewController: UITableViewDelegate {

    func tableView(
        _: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let header = UITableViewHeaderFooterView()
        let section = DEBUG_UI.SectionKind.allCases[section]

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

        let section = DEBUG_UI.SectionKind.allCases[indexPath.section]
        let item = section.initialItems[indexPath.row]
    }
}
