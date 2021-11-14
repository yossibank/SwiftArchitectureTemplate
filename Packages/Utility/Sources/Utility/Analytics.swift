import Foundation

public protocol AnalyticsProvider {
    func sendEvent(title: String)
}

public final class Analytics {

    public static var shared: Analytics = .init()

    var provider: AnalyticsProvider!

    private init() {}

    public func sendEvent(title: String = #function) {
        self.provider.sendEvent(title: title)
    }
}
