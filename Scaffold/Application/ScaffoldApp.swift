import Common
import ComposableDeeplinking
import ComposableNavigator
import Main
import SwiftUI

@main
struct ScaffoldApp: App {
    // MARK: - Properties

    let navigator: Navigator
    let dataSource: Navigator.Datasource
    let deeplinkHandler: DeeplinkHandler

    // MARK: - Initializer

    init() {
        dataSource = .init(root: MainScreen())
        navigator = Navigator(dataSource: dataSource)

        deeplinkHandler = DeeplinkHandler(
            navigator: navigator,
            parser: DeeplinkParser.scaffoldApp
        )
    }

    // MARK: - body

    var body: some Scene {
        WindowGroup {
            Root(dataSource: dataSource, pathBuilder: MainScreen.Builder())
                .onOpenURL { url in
                    // the matching parameter needs to match the URL
                    // scheme defined in the application's project file
                    if let deeplink = Deeplink(url: url, matching: "scaffolddl") {
                        deeplinkHandler.handle(deeplink: deeplink)
                    }
                }
        }
    }
}
