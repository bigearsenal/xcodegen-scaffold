import Foundation

final class LoginViewModel: ObservableObject {
    // MARK: - Methods

    func login() async {
        // Do something here

        // Handle
        await MainActor.run {
//            onLoggedIn()
        }
    }
}
