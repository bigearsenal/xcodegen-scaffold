import Common
import ComposableNavigator
import Foundation

public struct TrainListScreen: Screen {
    public let presentationStyle: ScreenPresentationStyle

    public init(presentationStyle: ScreenPresentationStyle = .push) {
        self.presentationStyle = presentationStyle
    }

    public struct Builder: NavigationTree {
        public init() {}

        public var builder: some PathBuilder {
            Screen(
                TrainListScreen.self,
                content: { TrainListView() }
                //                nesting: {
                //                    DetailScreen.Builder()
                //                }
            )
        }
    }
}
