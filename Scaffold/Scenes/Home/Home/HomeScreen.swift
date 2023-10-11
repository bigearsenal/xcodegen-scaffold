import Common
import ComposableNavigator
import Foundation

public struct HomeScreen: Screen {
    public let presentationStyle: ScreenPresentationStyle

    public init(presentationStyle: ScreenPresentationStyle = .sheet(allowsPush: false)) {
        self.presentationStyle = presentationStyle
    }

    public struct Builder: NavigationTree {
        public init() {}

        public var builder: some PathBuilder {
            Screen(
                HomeScreen.self,
                content: { HomeView() }
                //                nesting: {
                //                    DetailScreen.Builder()
                //                }
            )
        }
    }
}
