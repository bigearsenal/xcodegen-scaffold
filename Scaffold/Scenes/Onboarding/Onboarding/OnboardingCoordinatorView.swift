import Common
import Login
import SignUp
import SwiftUI
import SwiftUINavigation

public struct OnboardingCoordinatorView: CoordinatorView {
    // MARK: - Properties

    @ObservedObject public var coordinator: OnboardingCoordinator

    // MARK: - Initializer

    public init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }

    public var content: some View {
        OnboardingView(viewModel: coordinator.viewModel)
            .sheet(
                unwrapping: $coordinator.presenting,
                case: /OnboardingDestination.login,
                content: { _ in
                    LoginView {}
                }
            )
            .fullScreenCover(
                unwrapping: $coordinator.presenting,
                case: /OnboardingDestination.signUp,
                content: { _ in
                    SignUpView {}
                }
            )
    }
}

#Preview {
    let coordinator = OnboardingCoordinator()
    return OnboardingCoordinatorView(coordinator: coordinator)
}
