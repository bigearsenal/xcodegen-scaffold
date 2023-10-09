import Main
import SwiftUI

@main
struct ScaffoldApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinatorView(coordinator: .init())
                .environment(\.activeCoordinator, .init())
        }
    }
}
