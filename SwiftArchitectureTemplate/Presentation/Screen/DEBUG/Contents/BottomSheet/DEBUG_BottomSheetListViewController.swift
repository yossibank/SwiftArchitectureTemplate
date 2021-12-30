#if DEBUG

import UIKit

extension DEBUG_BottomSheetListViewController: VCInjectable {
    typealias VM = NoViewModel
    typealias UI = DEBUG_BottomSheetListUI
}

// MARK: - stored properties

final class DEBUG_BottomSheetListViewController: UIViewController {
    var viewModel: VM!
    var ui: UI!
}

// MARK: - override methods

extension DEBUG_BottomSheetListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
}

// MARK: - private methods

private extension DEBUG_BottomSheetListViewController {

    func setupUI() {
        ui.setupView(rootView: view)
    }

    func setupTableView() {
        ui.setupTableView(delegate: self)
        ui.loadTableItems()
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
                if ui.selectedStyles.contains(style) {
                    if let index = ui.selectedStyles.firstIndex(of: style) {
                        ui.selectedStyles.remove(at: index)
                    }
                } else {
                    ui.selectedStyles.append(style)
                }

                guard
                    let item = ui.selectedTableItem(index: indexPath)
                else {
                    return
                }

                ui.reloadTableItems(item: item)

            case .show:
                let title = ui.titleAvailable ? "DEBUG TITLE" : nil

                let body: String? = {
                    switch ui.messageType {
                        case .normal:
                            return "DEBUG Message"

                        case .empty:
                            return ""

                        case .none:
                            return nil
                    }
                }()

                let actions = ui.selectedStyles.map {
                    BottomSheetAction(title: $0.value, style: $0, handler: {})
                }

                showBottomSheet(
                    title: title,
                    body: body,
                    actions: actions
                )

            default:
                return
        }
    }
}

#endif
