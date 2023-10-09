import Foundation

/// Supported presentation style
public enum PresentationStyle {
    case alert
    case sheet
    case popover
    case fullScreenCover
}

/// Presenting type which defines the destination and presentation style
public struct Presenting<Destination> {
    let presentationStyle: PresentationStyle
    let destination: Destination
}

/// Coordinator type to manage Present navigation
@MainActor
public protocol PresentingCoordinator: Coordinator {
    /// Type that represents the presenting destination
    associatedtype Destination

    /// Current presenting
    var presenting: Presenting<Destination>? { get set }

    /// Present a destination
    func present(_ presenting: Presenting<Destination>)

    /// Dismiss presenting destination
    func dismissPresenting()
}

public extension PresentingCoordinator {
    func present(_ presenting: Presenting<Destination>) {
        self.presenting = presenting
    }

    func dismissPresenting() {
        presenting = nil
    }

    func backToRoot() {
        dismissPresenting()
    }
}
