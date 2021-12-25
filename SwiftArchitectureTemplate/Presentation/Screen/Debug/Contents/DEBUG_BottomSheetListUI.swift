import Combine
import UIKit

// MARK: - stored properties

final class DEBUG_BottomSheetListUI {

    var titleAvailable = true
    var messageType: MessageType = .normal
    var selectedStyles: [BottomSheetAction.ButtonStyle] = []

    private let tableView = UITableView()

    private var dataSourceSnapshot = NSDiffableDataSourceSnapshot<SectionKind, ItemKind>()
    private var dataSource: UITableViewDiffableDataSource<SectionKind, ItemKind>!

    private var cancellables: Set<AnyCancellable> = []
}

// MARK: - internal methods

extension DEBUG_BottomSheetListUI {

    func setupTableView(delegate: UITableViewDelegate) {
        self.dataSource = self.configureDataSource()
        self.tableView.dataSource = self.dataSource
        self.tableView.tableFooterView = UIView()
        self.tableView.rowHeight = 60
        self.tableView.delegate = delegate

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }

    func loadTableItems() {
        self.dataSourceSnapshot.appendSections(SectionKind.allCases)

        SectionKind.allCases.forEach {
            self.dataSourceSnapshot.appendItems($0.initialItems, toSection: $0)
        }

        self.dataSource.apply(
            self.dataSourceSnapshot,
            animatingDifferences: false
        )
    }

    func reloadTableItems(item: ItemKind) {
        self.dataSourceSnapshot.reloadItems([item])
        self.dataSource.apply(self.dataSourceSnapshot)
    }

    func selectedTableItem(index: IndexPath) -> ItemKind? {
        self.dataSource.itemIdentifier(for: index)
    }
}

// MARK: - private methods

private extension DEBUG_BottomSheetListUI {

    func configureDataSource() -> UITableViewDiffableDataSource<SectionKind, ItemKind> {
        .init(tableView: self.tableView) { [weak self] _, index, item in
            guard
                let self = self
            else {
                return UITableViewCell()
            }

            return self.makeCell(index: index, item: item)
        }
    }

    func makeCell(index _:IndexPath, item: ItemKind) -> UITableViewCell? {
        let cell = UITableViewCell()

        switch item {
            case .title:
                let titleSwitch = UISwitch()
                titleSwitch.isOn = self.titleAvailable
                titleSwitch.isOnPublisher.sink { [weak self] isOn in
                    self?.titleAvailable = isOn
                }
                .store(in: &self.cancellables)

                cell.accessoryView = titleSwitch
                cell.textLabel?.text = "TITLE AVAILABLE"

                return cell

            case .message:
                let messageSegment = UISegmentedControl(
                    frame: .init(x: 0, y: 0, width: 160, height: 40)
                )

                MessageType.allCases.enumerated().forEach { index, type in
                    messageSegment.insertSegment(
                        withTitle: type.rawValue,
                        at: index,
                        animated: false
                    )
                }

                messageSegment.selectedIndexPublisher.sink { [weak self] index in
                    guard
                        let self = self
                    else {
                        return
                    }

                    self.messageType = MessageType.allCases.any(at: index) ?? .normal
                }
                .store(in: &self.cancellables)

                messageSegment.selectedSegmentIndex = MessageType.allCases.firstIndex(
                    of: self.messageType
                ) ?? 0

                cell.accessoryView = messageSegment
                cell.textLabel?.text = "MESSAGE AVAILABLE"

                return cell

            case let .action(style):
                cell.textLabel?.text = String(describing: style)
                cell.accessoryType = self.selectedStyles.contains(style) ? .checkmark : .none

                return cell

            case .show:
                cell.textLabel?.text = "SHOW BOTTOM SHEET"

                return cell
        }
    }
}

// MARK: - protocol

extension DEBUG_BottomSheetListUI: UserInterface {

    func configureNavigationBar(viewController _: UIViewController) {}

    func setupView(rootView: UIView) {
        rootView.backgroundColor = .white
    }

    func setupLayout(rootView: UIView) {
        rootView.addSubViews(
            self.tableView,

            constraints:
            self.tableView.topAnchor.constraint(equalTo: rootView.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor)
        )
    }
}

extension DEBUG_BottomSheetListUI {

    enum SectionKind: String, CaseIterable {
        case title
        case message
        case action
        case show

        var initialItems: [ItemKind] {
            switch self {
                case .title:
                    return [.title]

                case .message:
                    return [.message]

                case .action:
                    return BottomSheetAction.ButtonStyle.allCases.map {
                        ItemKind.action($0)
                    }

                case .show:
                    return [.show]
            }
        }
    }

    enum ItemKind: Hashable {
        case title
        case message
        case action(BottomSheetAction.ButtonStyle)
        case show
    }

    enum MessageType: String, CaseIterable {
        case normal
        case empty
        case none
    }
}
