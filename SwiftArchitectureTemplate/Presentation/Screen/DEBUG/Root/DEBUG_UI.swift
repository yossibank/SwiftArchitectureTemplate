#if DEBUG

import Combine
import UIKit

// MARK: - debug UI event protocol

protocol DEBUG_UI_Delegate: AnyObject {
    func selectedThemeIndex(_ publisher: AnyPublisher<Int, Never>)
}

// MARK: - stored properties

final class DEBUG_UI {
    weak var delegate: DEBUG_UI_Delegate!

    private let tableView = UITableView()

    private var dataSourceSnapshot = NSDiffableDataSourceSnapshot<DEBUG_Section, DEBUG_Item>()
    private var dataSource: UITableViewDiffableDataSource<DEBUG_Section, DEBUG_Item>!
}

// MARK: - internal methods

extension DEBUG_UI {

    func injectDelegate(_ delegate: DEBUG_UI_Delegate) {
        self.delegate = delegate
    }

    func setupTableView(delegate: UITableViewDelegate) {
        dataSource = configureDataSource()

        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: UITableViewCell.resourceName
        )

        tableView.register(
            ThemeCell.self,
            forCellReuseIdentifier: ThemeCell.resourceName
        )

        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.rowHeight = 60

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }

        dataSourceSnapshot.appendSections(DEBUG_Section.allCases)

        DEBUG_Section.allCases.forEach {
            dataSourceSnapshot.appendItems($0.items, toSection: $0)
        }

        dataSource.apply(
            dataSourceSnapshot,
            animatingDifferences: false
        )
    }
}

// MARK: - private methods

private extension DEBUG_UI {

    func configureDataSource() -> UITableViewDiffableDataSource<DEBUG_Section, DEBUG_Item> {
        .init(tableView: tableView) { [weak self] tableView, indexPath, item in
            guard let self = self else {
                return UITableViewCell()
            }

            return self.makeCell(
                tableView: tableView,
                indexPath: indexPath,
                item: item
            )
        }
    }

    func makeCell(
        tableView: UITableView,
        indexPath: IndexPath,
        item: DEBUG_Item
    ) -> UITableViewCell? {
        switch item {
            case let .development(content):
                guard
                    let cell = tableView.dequeueReusableCell(
                        withIdentifier: ThemeCell.resourceName,
                        for: indexPath
                    ) as? ThemeCell
                else {
                    return UITableViewCell()
                }

                cell.configure(
                    title: content.rawValue,
                    themeStyle: AppDataHolder.colorTheme
                )

                delegate.selectedThemeIndex(cell.segmentPublisher)
                return cell

            case let .component(content):
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: UITableViewCell.resourceName,
                    for: indexPath
                )

                cell.textLabel?.font = .italicSystemFont(ofSize: 18)
                cell.textLabel?.text = content.rawValue.addSpaceAfterUppercase().uppercased()
                return cell

            case let .controller(content):
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: UITableViewCell.resourceName,
                    for: indexPath
                )

                cell.textLabel?.font = .italicSystemFont(ofSize: 18)
                cell.textLabel?.text = content.rawValue.addSpaceAfterUppercase().uppercased()
                return cell
        }
    }
}

// MARK: - protocol

extension DEBUG_UI: UserInterface {

    func setupView(rootView: UIView) {
        rootView.backgroundColor = .systemBackground

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

#endif
