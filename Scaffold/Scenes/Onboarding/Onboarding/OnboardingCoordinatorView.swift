import Login
import SignUp
import SwiftUI

public struct OnboardingCoordinatorView: View {
    // MARK: - Properties

    @ObservedObject private var coordinator: OnboardingCoordinator

    // MARK: - Initializer

    public init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }

    public var body: some View {
        OnboardingView(viewModel: coordinator.viewModel)
            .sheet(item: $coordinator.presenting) { scene in
                switch scene {
                case .login:
                    LoginView {
//                    viewModel.onLoggedIn()
                    }
                case .signUp:
                    SignUpView {
//                    viewModel.onLoggedIn()
                    }
                }
            }
    }
}

#Preview {
    let coordinator = OnboardingCoordinator()
    return OnboardingCoordinatorView(coordinator: coordinator)
}
