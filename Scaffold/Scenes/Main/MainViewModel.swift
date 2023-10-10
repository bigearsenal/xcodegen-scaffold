import Combine
import Common
import Foundation

@MainActor
final class MainViewModel: ObservableObject {
    @Published var isLoggedIn = false

    init() {
        loggedInPublisher
            .assign(to: &$isLoggedIn)
    }

    func checkLogin() -> Bool {
        isLoggedIn
    }
}
