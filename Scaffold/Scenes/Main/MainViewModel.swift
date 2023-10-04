import Foundation

final class MainViewModel: ObservableObject {
    // MARK: - Properties

    private var onLoggedOut: () -> Void

    // MARK: - Initializer

    init(onLoggedOut: @escaping () -> Void) {
        self.onLoggedOut = onLoggedOut
    }

    // MARK: - Methods

    func logout() async {
        // Do something here

        // Handle
        await MainActor.run {
            onLoggedOut()
        }
    }
}
