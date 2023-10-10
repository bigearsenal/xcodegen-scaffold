import Foundation

final class SignUpViewModel: ObservableObject {
    // MARK: - Methods

    func signUp() async {
        // Do something here

        // Handle
        await MainActor.run {
//            onSignedUp()
        }
    }
}
