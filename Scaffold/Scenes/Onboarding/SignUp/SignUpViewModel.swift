import Common
import Foundation

final class SignUpViewModel: ObservableObject {
    // MARK: - Methods

    func signUp() async {
        // Do something here
//        try? await Task.sleep(nanoseconds: 1_000_000_000)

        loggedInSubject.send(true)
    }
}
