import Common
import ComposableNavigator
import Foundation

public struct ListScreen: Screen {
    public let presentationStyle: ScreenPresentationStyle

    public init(presentationStyle: ScreenPresentationStyle = .push) {
        self.presentationStyle = presentationStyle
    }

    public struct Builder: NavigationTree {
        public init() {}

        public var builder: some PathBuilder {
            Screen(
                ListScreen.self,
                content: { ListView() }
                //                nesting: {
                //                    DetailScreen.Builder()
                //                }
            )
        }
    }
}
