import UIKit

extension DEBUG_ViewController: VCInjectable {
    typealias R = NoRouting
    typealias VM = NoViewModel
    typealias UI = NoUserInterface
}

// MARK: - stored properties

final class DEBUG_ViewController: UIViewController {
    var routing: R!
    var viewModel: VM!
    var ui: UI!
}

// MARK: - create instance

extension DEBUG_ViewController {

    static func createInstance() -> DEBUG_ViewController {
        .init()
    }
}

// MARK: - override methods

extension DEBUG_ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "DEBUG"
    }
}
