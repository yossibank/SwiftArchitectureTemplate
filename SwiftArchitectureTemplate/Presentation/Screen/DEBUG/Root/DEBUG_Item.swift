#if DEBUG

    enum DEBUG_Section: String, CaseIterable {
        case development
        case component
        case viewController

        var items: [DEBUG_Item] {
            switch self {
                case .development:
                    return DEBUG_Development.allCases.map(\.component)

                case .component:
                    return DEBUG_Component.allCases.map(\.component)

                case .viewController:
                    return DEBUG_Controller.allCases.map(\.component)
            }
        }
    }

    enum DEBUG_Item: Hashable {
        case development(DEBUG_Development)
        case component(DEBUG_Component)
        case controller(DEBUG_Controller)
    }

    enum DEBUG_Development: String, CaseIterable, Hashable {
        case theme

        var component: DEBUG_Item {
            .development(.theme)
        }
    }

    enum DEBUG_Component: String, CaseIterable, Hashable {
        case bottomSheetContent

        var component: DEBUG_Item {
            .component(.bottomSheetContent)
        }
    }

    enum DEBUG_Controller: String, CaseIterable, Hashable {
        case first
        case firstDetail
        case second

        var component: DEBUG_Item {
            switch self {
                case .first:
                    return .controller(.first)

                case .firstDetail:
                    return .controller(.firstDetail)

                case .second:
                    return .controller(.second)
            }
        }
    }

#endif
