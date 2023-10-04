import Common
import Foundation

final class LoginViewModel: ObservableObject {
    // MARK: - Dependencies

    private let loginService: LoginService

    // MARK: - Properties

    private var onLoggedIn: () -> Void

    var username: String { loginService.username }

    // MARK: - Initializer

    init(
        loginService: LoginService,
        onLoggedIn: @escaping () -> Void
    ) {
        self.onLoggedIn = onLoggedIn
        self.loginService = loginService
    }

    // MARK: - Methods

    func login() async {
        // Do something here
        try? await loginService.login()

        // Handle
        await MainActor.run {
            onLoggedIn()
        }
    }
}
