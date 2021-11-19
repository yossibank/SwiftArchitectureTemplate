import UIKit

// MARK: - stored properties

final class DEBUG_UI {

    private let tableView = UITableView()

    private var dataSource: UITableViewDiffableDataSource<SectionKind, ItemKind>!
}

// MARK: - internal methods

extension DEBUG_UI {

    func setupTableView(delegate: UITableViewDelegate) {
        self.dataSource = self.configureDataSource()
        self.tableView.dataSource = self.dataSource
        self.tableView.rowHeight = 60
        self.tableView.delegate = delegate

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }

    func loadTableItems() {
        var snapShot = NSDiffableDataSourceSnapshot<SectionKind, ItemKind>()
        snapShot.appendSections(SectionKind.allCases)
        SectionKind.allCases.forEach {
            snapShot.appendItems($0.initialItems, toSection: $0)
        }
        self.dataSource.apply(snapShot, animatingDifferences: false)
    }
}

// MARK: - private methods

private extension DEBUG_UI {

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
        rootView.addSubview(self.tableView)
    }

    func setupLayout(rootView: UIView) {
        self.tableView.layout {
            $0.top == rootView.safeAreaLayoutGuide.topAnchor
            $0.bottom == rootView.safeAreaLayoutGuide.bottomAnchor
            $0.leading == rootView.leadingAnchor
            $0.trailing == rootView.trailingAnchor
        }
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
                    return [.bottomSheet, .first, .firstDetail, .second]
            }
        }
    }

    enum ItemKind: String, Hashable {

        /* View */
        case bottomSheetContent

        /* ViewController */
        case bottomSheet
        case first
        case firstDetail
        case second
    }
}
