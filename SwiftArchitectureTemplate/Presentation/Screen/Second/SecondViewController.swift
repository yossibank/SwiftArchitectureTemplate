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

// MARK: - create instance

extension SecondViewController {

    static func createInstance() -> SecondViewController {
        let instance = SecondViewController()
        instance.inject(viewModel: SecondViewModel(), ui: SecondUI())
        return instance
    }
}

// MARK: - override methods

extension SecondViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

// MARK: - private methods

private extension SecondViewController {

    func setupUI() {
        self.ui.configureNavigationBar(viewController: self)
        self.ui.setupView(rootView: self.view)
        self.ui.setupLayout(rootView: self.view)
    }
}
