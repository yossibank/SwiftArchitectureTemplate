import UIKit

protocol VCInjectable: UIViewController {

    associatedtype R: Routing
    associatedtype VM: ViewModel
    associatedtype UI: UserInterface

    var routing: R! { get set }
    var viewModel: VM! { get set }
    var ui: UI! { get set }

    func inject(
        routing: R,
        viewModel: VM,
        ui: UI
    )
}

extension VCInjectable {

    func inject(
        routing: R,
        viewModel: VM,
        ui: UI
    ) {
        self.routing = routing
        self.viewModel = viewModel
        self.ui = ui
    }
}

extension VCInjectable where R == NoRouting {

    func inject(viewModel: VM, ui: UI) {
        self.routing = R()
        self.viewModel = viewModel
        self.ui = ui
    }
}

extension VCInjectable where VM == NoViewModel {

    func inject(routing: R, ui: UI) {
        self.routing = routing
        self.viewModel = VM()
        self.ui = ui
    }
}

extension VCInjectable where UI == NoUserInterface {

    func inject(routing: R, viewModel: VM) {
        self.routing = routing
        self.viewModel = viewModel
        self.ui = UI()
    }
}

extension VCInjectable where R == NoRouting, VM == NoViewModel {

    func inject(ui: UI) {
        self.routing = R()
        self.viewModel = VM()
        self.ui = ui
    }
}

extension VCInjectable where R == NoRouting, UI == NoUserInterface {

    func inject(viewModel: VM) {
        self.routing = R()
        self.viewModel = viewModel
        self.ui = UI()
    }
}

extension VCInjectable where VM == NoViewModel, UI == NoUserInterface {

    func inject(routing: R) {
        self.routing = routing
        self.viewModel = VM()
        self.ui = UI()
    }
}

extension VCInjectable where R == NoRouting, VM == NoViewModel, UI == NoUserInterface {

    func inject() {
        self.routing = R()
        self.viewModel = VM()
        self.ui = UI()
    }
}
