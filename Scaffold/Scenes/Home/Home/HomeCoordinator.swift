import Foundation
import Settings
import Stinsen
import SwiftUI
import TrainList

public final class HomeCoordinator: TabCoordinatable {
    // MARK: - Properties

    public var child = TabChild(
        startingItems: [
            \HomeCoordinator.trainList,
            \HomeCoordinator.settings,
        ]
    )

    // MARK: - Routes

    @Route(tabItem: makeTrainListTab) private var trainList = makeTrainList
    @Route(tabItem: makeSettingsTab) public var settings = makeSettings

    // MARK: - Initializer

    public init() {}

    deinit {
        print("Deinit \(String(reflecting: self))")
    }

    // MARK: - Builders

    // TrainList

    func makeTrainList() -> NavigationViewCoordinator<TrainListCoordinator> {
        .init(TrainListCoordinator())
    }

    @ViewBuilder func makeTrainListTab(isActive: Bool) -> some View {
        Image(systemName: "house" + (isActive ? ".fill" : ""))
        Text("Home")
    }

    // Settings

    func makeSettings() -> NavigationViewCoordinator<SettingsCoordinator> {
        NavigationViewCoordinator(SettingsCoordinator())
    }

    @ViewBuilder func makeSettingsTab(isActive: Bool) -> some View {
        Image(systemName: "folder" + (isActive ? ".fill" : ""))
        Text("Todos")
    }
}
