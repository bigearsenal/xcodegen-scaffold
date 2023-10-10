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
            parser: DeeplinkParser.exampleApp
        )
    }

    // MARK: - body

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
