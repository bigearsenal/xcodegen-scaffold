import Common
import Foundation

public enum MainNavigatableView {
    case home
    case onboarding
}

@MainActor
public class MainCoordinator: ReplacingCoordinator {
    // MARK: - Properties

    public let id: String = UUID().uuidString
    @Published public var currentView: MainNavigatableView?

    // MARK: - Initializer

    public init() {
        currentView = .onboarding
    }

    public func backToRoot() {
        // do nothing
    }
}
