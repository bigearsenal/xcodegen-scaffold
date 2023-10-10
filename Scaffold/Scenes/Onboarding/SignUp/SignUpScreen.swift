import Common
import ComposableNavigator
import Foundation

public struct SignUpScreen: Screen {
    public let presentationStyle: ScreenPresentationStyle

    public init(presentationStyle: ScreenPresentationStyle = .sheet(allowsPush: false)) {
        self.presentationStyle = presentationStyle
    }

    public struct Builder: NavigationTree {
        public init() {}

        public var builder: some PathBuilder {
            Screen(
                SignUpScreen.self,
                content: { SignUpView() }
                //                nesting: {
                //                    DetailScreen.Builder()
                //                }
            )
        }
    }
}
