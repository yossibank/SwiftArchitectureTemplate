import Foundation

public protocol AnalyticsProvider {
    func sendEvent(title: String)
}

public final class Analytics {
    var provider: AnalyticsProvider?

    public static var shared: Analytics = .init()

    private init() {}

    public func sendEvent(title: String = #function) {
        provider?.sendEvent(title: title)
    }
}
