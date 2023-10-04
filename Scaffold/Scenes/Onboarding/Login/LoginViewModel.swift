import Foundation

final class LoginViewModel: ObservableObject {
    // MARK: - Properties

    private var onLoggedIn: () -> Void

    // MARK: - Initializer

    init(onLoggedIn: @escaping () -> Void) {
        self.onLoggedIn = onLoggedIn
    }

    // MARK: - Methods

    func login() async {
        // Do something here

        // Handle
        await MainActor.run {
            onLoggedIn()
        }
    }
}
