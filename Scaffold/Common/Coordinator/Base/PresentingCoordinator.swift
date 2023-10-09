import Foundation

/// Coordinator type to manage Present navigation
@MainActor
public protocol PresentingCoordinator: Coordinator {
    /// Type that represents the presenting destination
    associatedtype Destination: Identifiable

    /// Current presenting
    var presenting: Destination? { get set }

    /// Present a destination
    func present(destination: Destination)

    /// Dismiss presenting destination
    func dismissPresenting()
}

public extension PresentingCoordinator {
    func present(destination: Destination) {
        presenting = destination
    }

    func dismissPresenting() {
        presenting = nil
    }

    func backToRoot() {
        dismissPresenting()
    }
}
