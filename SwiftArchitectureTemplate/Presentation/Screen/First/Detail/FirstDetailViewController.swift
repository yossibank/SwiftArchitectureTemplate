import UIKit

extension FirstDetailViewController: VCInjectable {
    typealias R = NoRouting
    typealias VM = NoViewModel
    typealias UI = NoUserInterface
}

// MARK: - stored properties

final class FirstDetailViewController: UIViewController {
    var routing: R!
    var viewModel: VM!
    var ui: UI!
}

// MARK: - override methods

extension FirstDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "DETAIL"
    }
}
