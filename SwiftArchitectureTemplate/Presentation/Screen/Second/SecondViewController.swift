import UIKit

extension SecondViewController: VCInjectable {
    typealias VM = SecondViewModel
    typealias UI = SecondUI
}

// MARK: - stored properties

final class SecondViewController: UIViewController {
    var viewModel: VM!
    var ui: UI!
}

// MARK: - override methods

extension SecondViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - private methods

private extension SecondViewController {

    func setupUI() {
        ui.setupNavigationBar(
            navigationBar: navigationController?.navigationBar,
            navigationItem: navigationItem
        )
        ui.setupView(rootView: view)
    }
}
