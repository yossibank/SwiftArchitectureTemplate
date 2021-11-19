import UIKit

extension DEBUG_BottomSheetListViewController: VCInjectable {
    typealias R = NoRouting
    typealias VM = NoViewModel
    typealias UI = DEBUG_BottomSheetListUI
}

// MARK: - stored properties

final class DEBUG_BottomSheetListViewController: UIViewController {
    var routing: R!
    var viewModel: VM!
    var ui: UI!
}

// MARK: - override methods

extension DEBUG_BottomSheetListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupTableView()
    }
}

// MARK: - private methods

private extension DEBUG_BottomSheetListViewController {

    func setupUI() {
        self.ui.configureNavigationBar(viewController: self)
        self.ui.setupView(rootView: self.view)
        self.ui.setupLayout(rootView: self.view)
    }

    func setupTableView() {
        self.ui.setupTableView(delegate: self)
        self.ui.loadTableItems()
    }
}

// MARK: - delegate

extension DEBUG_BottomSheetListViewController: UITableViewDelegate {

    func tableView(
        _: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let header = UITableViewHeaderFooterView()
        let section = DEBUG_BottomSheetListUI.SectionKind.allCases[section]

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

        let section = DEBUG_BottomSheetListUI.SectionKind.allCases[indexPath.section]
        let item = section.initialItems[indexPath.row]

        switch item {
            case let .action(style):
                if self.ui.selectedStyles.contains(style) {
                    if let index = self.ui.selectedStyles.firstIndex(of: style) {
                        self.ui.selectedStyles.remove(at: index)
                    }
                } else {
                    self.ui.selectedStyles.append(style)
                }

                guard
                    let item = self.ui.selectedTableItem(index: indexPath)
                else {
                    return
                }

                self.ui.reloadTableItems(item: item)

            case .show:
                let title = self.ui.titleAvailable ? "DEBUG TITLE" : nil

                let body: String? = {
                    switch self.ui.messageType {
                        case .normal:
                            return "DEBUG Message"

                        case .empty:
                            return ""

                        case .none:
                            return nil
                    }
                }()

                let actions = self.ui.selectedStyles.map {
                    BottomSheetAction(title: $0.value, style: $0, handler: {})
                }

                self.showBottomSheet(
                    title: title,
                    body: body,
                    actions: actions
                )

            default:
                return
        }
    }
}
