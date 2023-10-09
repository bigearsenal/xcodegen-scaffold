import Foundation

@MainActor
final class OnboardingViewModel: ObservableObject {
    private unowned let coordinator: OnboardingCoordinator

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }

    func openLogin() {
        coordinator.present(destination: .login)
    }

    func openSignUp() {
        coordinator.present(destination: .signUp)
    }
}
