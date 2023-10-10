import Common
import Main
import Resolver
import SwiftUI

@main
struct ScaffoldApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinatorView(coordinator: .init())
                .onOpenURL { url in
                    Resolver.resolve(DeeplinkManager.self)
                        .manage(url: url)
                }
                .environment(\.activeCoordinator, .init())
        }
    }
}
