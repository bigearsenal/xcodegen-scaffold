import Foundation

/// Coordinator that manages navigation state
public protocol Coordinator {
    /// Unique id of a Coordinator
    var id: String { get }

    /// Go back to root of the coordinator
    func backToRoot()
}
