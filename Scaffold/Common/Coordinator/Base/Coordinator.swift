import Foundation

/// Coordinator that manages navigation state
@MainActor
public protocol Coordinator: ObservableObject {
    /// Unique id of a Coordinator
    var id: String { get }

    /// Go back to root of the coordinator
    func backToRoot()
}
