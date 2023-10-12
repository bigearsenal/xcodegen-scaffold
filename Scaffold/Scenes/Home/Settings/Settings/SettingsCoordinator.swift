import Foundation
import Stinsen
import SwiftUI

public final class SettingsCoordinator: NavigationCoordinatable {
    public let stack = Stinsen.NavigationStack(initial: \SettingsCoordinator.start)

    @Root private var start = makeStart
    @Route(.modal) public var profile = makeProfile

    public init() {}

    deinit {
        print("Deinit \(String(reflecting: self))")
    }

    @ViewBuilder func makeStart() -> some View {
        SettingsView()
    }

    @ViewBuilder func makeProfile() -> some View {
        NavigationStack {
            ProfileView()
        }
    }
}
