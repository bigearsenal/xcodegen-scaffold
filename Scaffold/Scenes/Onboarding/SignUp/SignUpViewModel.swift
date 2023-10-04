import Foundation

final class SignUpViewModel: ObservableObject {
    // MARK: - Properties

    private var onSignedUp: () -> Void

    // MARK: - Initializer

    init(onSignedUp: @escaping () -> Void) {
        self.onSignedUp = onSignedUp
    }

    // MARK: - Methods

    func signUp() async {
        // Do something here

        // Handle
        await MainActor.run {
            onSignedUp()
        }
    }
}
