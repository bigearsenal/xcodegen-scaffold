import Combine
import Common
import ComposableDeeplinking
import ComposableNavigator
import Home
import Onboarding
import PinCode
import SwiftUI

@main
struct ScaffoldApp: App {
    // MARK: - Properties

    let navigator: Navigator
    let dataSource: Navigator.Datasource
    let deeplinkHandler: DeeplinkHandler

    // MARK: - Initializer

    init() {
        dataSource = .init(root: rootScreen)
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
                .onReceive(
                    Publishers.Merge(
                        loggedInPublisher.dropFirst(),
                        pincodeAuthorizedPublisher.dropFirst()
                    )
                ) { _ in
                    navigator.replace(path: rootScreen)
                }
        }
    }
}

// MARK: - Helpers

private var rootScreen: AnyScreen {
    if isLoggedIn {
        return HomeScreen().eraseToAnyScreen()
    } else if pincodeAuthorizedSubject.value {
        return PinCodeScreen().eraseToAnyScreen()
    } else {
        return HomeScreen().eraseToAnyScreen()
    }
}
