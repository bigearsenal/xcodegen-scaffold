import Common
import ComposableNavigator
import Foundation
import Onboarding

public struct MainScreen: Screen {
    public let presentationStyle: ScreenPresentationStyle

    public init(presenationStyle: ScreenPresentationStyle = .push) {
        presentationStyle = presenationStyle
    }

    public struct Builder: NavigationTree {
        public init() {}

        public var builder: some PathBuilder {
            Screen(
                MainScreen.self,
                content: { MainView() },
                nesting: {
                    OnboardingScreen.Builder()
                }
            )
        }
    }
}
