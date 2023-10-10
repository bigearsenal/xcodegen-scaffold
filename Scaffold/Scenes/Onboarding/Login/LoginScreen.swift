import Common
import ComposableNavigator
import Foundation
import SwiftUI

public struct LoginScreen: Screen {
    public let presentationStyle: ScreenPresentationStyle

    public init(presentationStyle: ScreenPresentationStyle = .sheet(
        allowsPush: false,
        presentationDetent: [.fraction(2.0 / 3)]
    )) {
        self.presentationStyle = presentationStyle
    }

    public struct Builder: NavigationTree {
        public init() {}

        public var builder: some PathBuilder {
            Screen(
                LoginScreen.self,
                content: { LoginView() }
                //                nesting: {
                //                    DetailScreen.Builder()
                //                }
            )
        }
    }
}
