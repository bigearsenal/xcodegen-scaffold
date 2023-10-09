import Foundation

/// Coordinator type to manage Tab Navigation
public protocol TabCoordinator: AnyObject, Coordinator {
    /// Type that represents tab in coordinator
    associatedtype Tab

    /// Current opening tab
    var currentTab: Tab? { get set }

    /// Switch tab
    func `switch`(to tab: Tab)
}

public extension TabCoordinator {
    func `switch`(to tab: Tab) {
        currentTab = tab
    }

    func backToRoot() {
        // Do nothing
    }
}
