import Home
import Onboarding
import SwiftUI

public struct MainCoordinatorView: View {
    @ObservedObject var coordinator: MainCoordinator

    public var body: some View {
        switch coordinator.currentView {
        case .home:
            HomeView {
                coordinator.currentView = .onboarding
            }
        case .onboarding:
            OnboardingView {
                coordinator.currentView = .home
            }
        case .none:
            EmptyView()
        }
    }
}

#Preview {
    MainCoordinatorView(coordinator: .init())
}
