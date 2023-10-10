import Common
import Foundation

final class LoginViewModel: ObservableObject {
    // MARK: - Methods

    func login() async {
        // Do something here

        loggedInSubject.send(true)
    }
}
