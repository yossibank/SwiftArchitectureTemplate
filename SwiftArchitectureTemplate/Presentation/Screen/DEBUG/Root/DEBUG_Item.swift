import Foundation

enum DEBUG_Section: String, CaseIterable {
    case view
    case viewController

    var initialItems: [DEBUG_Item] {
        switch self {
            case .view:
                return [.bottomSheetContent]

            case .viewController:
                return [.first, .firstDetail, .second]
        }
    }
}

enum DEBUG_Item: String, Hashable {

    /* View */
    case bottomSheetContent

    /* ViewController */
    case first
    case firstDetail
    case second
}
