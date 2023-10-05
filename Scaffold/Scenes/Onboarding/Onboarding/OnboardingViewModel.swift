import Foundation

enum NavigatableScene: Int, Identifiable {
    var id: Int { rawValue }

    case login = 0
    case signUp
}

final class OnboardingViewModel: ObservableObject {
    // MARK: - Properties

    let onLoggedIn: () -> Void

    @Published var currentScene: NavigatableScene?

    // MARK: - Initializers

    init(onLoggedIn: @escaping () -> Void) {
        self.onLoggedIn = onLoggedIn
    }
}
