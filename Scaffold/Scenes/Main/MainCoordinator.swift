import Common
import Foundation

enum MainNavigatableView {
    case home
    case onboarding
}

@MainActor
class MainCoordinator: ReplacingCoordinator {
    // MARK: - Properties

    let id: String = UUID().uuidString
    @Published var currentView: MainNavigatableView?

    // MARK: - Initializer

    func backToRoot() {
        // do nothing
    }
}
