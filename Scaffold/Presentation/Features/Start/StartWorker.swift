import Foundation
import Services

protocol StartWorkerProtocol {
    func isAuthenticated() async -> Bool
}

final class StartWorker: StartWorkerProtocol {
    // MARK: - Initialization

    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    private let authService: AuthServiceProtocol

    // MARK: - Protocol Methods

    func isAuthenticated() async -> Bool {
        await authService.isSignedIn()
    }
}
