import Home
import Onboarding
import SwiftUI

public struct MainCoordinatorView: View {
    @ObservedObject var coordinator: MainCoordinator

    public init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }

    public var body: some View {
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
