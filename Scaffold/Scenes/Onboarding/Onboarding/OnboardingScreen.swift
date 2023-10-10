import Common
import ComposableNavigator
import Foundation
import Login
import SignUp

public struct OnboardingScreen: Screen {
    public let presentationStyle: ScreenPresentationStyle

    public init(presentationStyle: ScreenPresentationStyle = .push) {
        self.presentationStyle = presentationStyle
    }

    public struct Builder: NavigationTree {
        public init() {}

        public var builder: some PathBuilder {
            Screen(
                OnboardingScreen.self,
                content: { OnboardingView() },
                nesting: {
                    LoginScreen.Builder()
                    SignUpScreen.Builder()
                }
            )
        }
    }
}
