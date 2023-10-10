import Common
import ComposableNavigator
import Foundation

public struct MainScreen: Screen {
    public let presentationStyle: ScreenPresentationStyle

    public init(presenationStyle: ScreenPresentationStyle = .push) {
        presentationStyle = presenationStyle
    }

    public struct Builder: NavigationTree {
        public var builder: some PathBuilder {
            Screen(
                MainScreen.self,
                content: { MainView() }
//                nesting: {
//                    DetailScreen.Builder()
//                }
            )
        }
    }
}
