import UIKit

extension SecondViewController: VCInjectable {
    typealias R = NoRouting
    typealias VM = SecondViewModel
    typealias UI = SecondUI
}

// MARK: - stored properties

final class SecondViewController: UIViewController {
    var routing: R!
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
        ui.configureNavigationBar(viewController: self)
        ui.setupView(rootView: view)
        ui.setupLayout(rootView: view)
    }
}
