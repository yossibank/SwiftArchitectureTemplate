import UIKit

typealias VoidBlock = () -> Void

protocol Initializable: AnyObject {
    static var className: String { get }
    static var resourceName: String { get }
}

protocol ClassInitializable: Initializable {}

extension NSObject: ClassInitializable {
    static var className: String {
        String(describing: self)
    }

    static var resourceName: String {
        className
    }
}

extension Initializable where Self: UIViewController {
    static func instantiateInitialViewController(
        fromStoryboardOrNil customStoryboard: String? = nil
    ) -> Self {
        let finalStoryboardName = customStoryboard ?? resourceName
        let storyboard = UIStoryboard(name: finalStoryboardName, bundle: Bundle(for: self))
        let controller = storyboard.instantiateInitialViewController()
        return controller as! Self
    }

    @discardableResult
    static func initialize(
        fromXibOrNil customXib: String? = nil,
        ownerOrNil owner: Any? = nil,
        optionOrNil options: [UINib.OptionsKey: Any]? = nil
    ) -> Self? {
        let firstView = xib(fromXibOrNil: customXib).instantiate(
            withOwner: owner,
            options: options
        ).first

        return firstView as? Self
    }

    static func xib(
        fromXibOrNil customXib: String? = nil
    ) -> UINib {
        let finalXibName = customXib ?? resourceName
        return UINib(nibName: finalXibName, bundle: Bundle(for: self))
    }
}
