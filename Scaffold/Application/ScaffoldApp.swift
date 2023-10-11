import Common
import ComposableDeeplinking
import ComposableNavigator
import Home
import Onboarding
import SwiftUI

@main
struct ScaffoldApp: App {
    // MARK: - Properties

    let navigator: Navigator
    let dataSource: Navigator.Datasource
    let deeplinkHandler: DeeplinkHandler

    // MARK: - Initializer

    init() {
        dataSource = .init(root: Self.rootScreen)
        navigator = Navigator(dataSource: dataSource)

        deeplinkHandler = DeeplinkHandler(
            navigator: navigator,
            parser: DeeplinkParser.scaffoldApp
        )
    }

    // MARK: - body

    var body: some Scene {
        WindowGroup {
            Root(dataSource: dataSource, pathBuilder: AppNavigationTree())
                .onOpenURL { url in
                    // the matching parameter needs to match the URL
                    // scheme defined in the application's project file
                    if let deeplink = Deeplink(url: url, matching: "scaffolddl") {
                        deeplinkHandler.handle(deeplink: deeplink)
                    }
                }
                .onReceive(loggedInPublisher.dropFirst()) { _ in
                    navigator.replace(path: Self.rootScreen)
                }
        }
    }

    // MARK: - Helpers

    private static var rootScreen: AnyScreen {
        isLoggedIn ?
            HomeScreen().eraseToAnyScreen() :
            OnboardingScreen().eraseToAnyScreen()
    }
}
