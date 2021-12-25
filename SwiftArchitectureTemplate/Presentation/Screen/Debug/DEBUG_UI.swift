import UIKit

// MARK: - stored properties

final class DEBUG_UI {

    private let tableView = UITableView()

    private var dataSourceSnapshot = NSDiffableDataSourceSnapshot<SectionKind, ItemKind>()
    private var dataSource: UITableViewDiffableDataSource<SectionKind, ItemKind>!
}

// MARK: - internal methods

extension DEBUG_UI {

    func setupTableView(delegate: UITableViewDelegate) {
        dataSource = configureDataSource()
        tableView.dataSource = dataSource
        tableView.rowHeight = 60
        tableView.delegate = delegate

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }

    func loadTableItems() {
        dataSourceSnapshot.appendSections(SectionKind.allCases)

        SectionKind.allCases.forEach {
            self.dataSourceSnapshot.appendItems($0.initialItems, toSection: $0)
        }

        dataSource.apply(
            dataSourceSnapshot,
            animatingDifferences: false
        )
    }
}

// MARK: - private methods

private extension DEBUG_UI {

    func configureDataSource() -> UITableViewDiffableDataSource<SectionKind, ItemKind> {
        .init(tableView: tableView) { [weak self] _, index, item in
            guard
                let self = self
            else {
                return UITableViewCell()
            }

            return self.makeCell(index: index, item: item)
        }
    }

    func makeCell(index _: IndexPath, item: ItemKind) -> UITableViewCell? {
        let cell = UITableViewCell()
        cell.textLabel?.font = .italicSystemFont(ofSize: 18)
        cell.textLabel?.text = item.rawValue.addSpaceAfterUppercase().uppercased()
        return cell
    }
}

// MARK: - protocol

extension DEBUG_UI: UserInterface {

    func configureNavigationBar(viewController: UIViewController) {
        viewController.title = "DEBUG"
    }

    func setupView(rootView: UIView) {
        rootView.backgroundColor = .white
    }

    func setupLayout(rootView: UIView) {
        rootView.addSubViews(
            tableView,

            constraints:
            tableView.topAnchor.constraint(equalTo: rootView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor)
        )
    }
}

extension DEBUG_UI {

    enum SectionKind: String, CaseIterable {
        case view
        case viewController

        var initialItems: [ItemKind] {
            switch self {
                case .view:
                    return [.bottomSheetContent]

                case .viewController:
                    return [.first, .firstDetail, .second]
            }
        }
    }

    enum ItemKind: String, Hashable {

        /* View */
        case bottomSheetContent

        /* ViewController */
        case first
        case firstDetail
        case second
    }
}
