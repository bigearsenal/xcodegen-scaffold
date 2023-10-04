import Foundation

final class OnboardingViewModel: ObservableObject {
    // MARK: - Properties

    var onLoggedIn: () -> Void

    // MARK: - Initializers

    init(onLoggedIn: @escaping () -> Void) {
        self.onLoggedIn = onLoggedIn
    }
}
