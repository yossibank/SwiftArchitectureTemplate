import UIKit

// MARK: - inject

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
        ui.setupView(rootView: view)
    }
}
