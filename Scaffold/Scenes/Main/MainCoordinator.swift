import Common
import Foundation

enum MainNavigatableView {
    case home
    case onboarding
}

class MainCoordinator: ReplacingCoordinator {
    let id: String = UUID().uuidString
    @Published var currentView: MainNavigatableView?

    func backToRoot() {
        // do nothing
    }
}
