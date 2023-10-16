import Foundation
import Stinsen
import SwiftUI

public final class DAppsWidgetCoordinator: NavigationCoordinatable {
    public let stack = Stinsen.NavigationStack(initial: \DAppsWidgetCoordinator.start)

    @Root private var start = makeStart

    public init() {}

    deinit {
        print("Deinit \(String(reflecting: self))")
    }

    @ViewBuilder func makeStart() -> some View {
        DAppsWidgetView()
    }
}
