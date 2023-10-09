import Common
import Home
import Onboarding
import SwiftUI

public struct MainCoordinatorView: CoordinatorView {
    @ObservedObject public var coordinator: MainCoordinator

    public init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }

    public var content: some View {
        switch coordinator.currentView {
        case .home:
            HomeView {
                coordinator.currentView = .onboarding
            }
        case .onboarding:
            OnboardingCoordinatorView(coordinator: .init())
        case .none:
            EmptyView()
        }
    }
}

#Preview {
    MainCoordinatorView(coordinator: .init())
}
