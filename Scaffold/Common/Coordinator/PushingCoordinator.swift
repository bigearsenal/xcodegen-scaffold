import Foundation

/// Coordinator type to manage Push Navigation
public protocol PushingCoordinator: AnyObject, Coordinator {
    /// Type that represents Destination in Push navigation
    associatedtype Destination

    /// Current pushing destinations stack
    var pushing: [Destination] { get set }

    /// Push a destination into navigation stack
    func push(_ destination: Destination)

    /// Pop last destination from navigation stack
    func popLast()
}

public extension PushingCoordinator {
    func push(_ destination: Destination) {
        pushing.append(destination)
    }

    func popLast() {
        _ = pushing.popLast()
    }

    func backToRoot() {
        pushing = []
    }
}
