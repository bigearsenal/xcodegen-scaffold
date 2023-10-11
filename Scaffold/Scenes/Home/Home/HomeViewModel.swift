import Common
import Foundation

final class HomeViewModel: ObservableObject {
    // MARK: - Methods

    func logout() async {
        // Do something here

        loggedInSubject.send(false)
    }
}
