import Common
import ComposableNavigator
import Foundation
import Home
import Onboarding

struct AppNavigationTree: NavigationTree {
    var builder: some PathBuilder {
        PathBuilders.if(
            { isLoggedIn },
            then: Wildcard(
                screen: HomeScreen(),
                pathBuilder: HomeScreen.Builder()
            ),
            else: Wildcard(
                screen: OnboardingScreen(),
                pathBuilder: OnboardingScreen.Builder()
            )
        )
    }
}
