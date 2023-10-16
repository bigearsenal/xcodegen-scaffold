import DApps
import Foundation
import Settings
import Stinsen
import SwiftUI
import TrainList

public final class HomeCoordinator: TabCoordinatable {
    // MARK: - Properties

    public var child = TabChild(
        startingItems: [
            \HomeCoordinator.dAppsWidget,
            \HomeCoordinator.trainList,
            \HomeCoordinator.settings,
        ]
    )

    // MARK: - Routes

    @Route(tabItem: makeDAppsWidgetTab) private var dAppsWidget = makeDAppsWidget
    @Route(tabItem: makeTrainListTab) private var trainList = makeTrainList
    @Route(tabItem: makeSettingsTab) public var settings = makeSettings

    // MARK: - Initializer

    public init() {}

    deinit {
        print("Deinit \(String(reflecting: self))")
    }

    // MARK: - Builders

    // DAppsWidget
    private func makeDAppsWidget() -> NavigationViewCoordinator<DAppsWidgetCoordinator> {
        .init(.init())
    }

    @ViewBuilder private func makeDAppsWidgetTab(isActive: Bool) -> some View {
        Image(systemName: "house" + (isActive ? ".fill" : ""))
        Text("Home")
    }

    // TrainList

    private func makeTrainList() -> NavigationViewCoordinator<TrainListCoordinator> {
        .init(TrainListCoordinator())
    }

    @ViewBuilder private func makeTrainListTab(isActive: Bool) -> some View {
        Image(systemName: "location" + (isActive ? ".fill" : ""))
        Text("Train")
    }

    // Settings

    private func makeSettings() -> NavigationViewCoordinator<SettingsCoordinator> {
        NavigationViewCoordinator(SettingsCoordinator())
    }

    @ViewBuilder private func makeSettingsTab(isActive: Bool) -> some View {
        Image(systemName: "gearshape" + (isActive ? ".fill" : ""))
        Text("Settings")
    }
}
