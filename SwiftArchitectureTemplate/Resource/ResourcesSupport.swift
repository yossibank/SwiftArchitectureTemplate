import UIKit

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
        self.className
    }
}


extension Initializable where Self: UIViewController {

    static func instantiateInitialViewController(
        fromStoryboardOrNil customStoryboard: String? = nil
    ) -> Self {
        let finalStoryboardName = customStoryboard ?? self.resourceName
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
        let firstView = self.xib(fromXibOrNil: customXib).instantiate(
            withOwner: owner,
            options: options
        ).first

        return firstView as? Self
    }

    static func xib(
        fromXibOrNil customXib: String? = nil
    ) -> UINib {
        let finalXibName = customXib ?? self.resourceName
        return UINib(nibName: finalXibName, bundle: Bundle(for: self))
    }
}
