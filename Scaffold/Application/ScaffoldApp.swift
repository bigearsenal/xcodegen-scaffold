import Combine
import SwiftUI

@main
struct ScaffoldApp: App {
    // MARK: - body

    var body: some Scene {
        WindowGroup {
            AppCoordinator().view()
        }
    }
}
