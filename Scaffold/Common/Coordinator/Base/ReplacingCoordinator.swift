import Foundation

/// Coordinator type to manage Push Navigation
public protocol ReplacingCoordinator: Coordinator {
    /// Type that represents Destination in Push navigation
    associatedtype View

    /// Current pushing destinations stack
    var currentView: View? { get set }

    /// Push a destination into navigation stack
    func replaceCurrentView(by newView: View)
}

public extension ReplacingCoordinator {
    func replaceCurrentView(by newView: View) {
        currentView = newView
    }
}
