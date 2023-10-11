import Common
import ComposableNavigator
import Foundation
import Home
import Onboarding
import PinCode

struct AppNavigationTree: NavigationTree {
    var builder: some PathBuilder {
        PathBuilders.if(
            {
                isLoggedIn
            },
            then: PathBuilders.if(
                {
                    pincodeAuthorizedSubject.value
                },
                then: Wildcard(
                    screen: HomeScreen(),
                    pathBuilder: HomeScreen.Builder()
                ),
                else: Wildcard(
                    screen: PinCodeScreen(),
                    pathBuilder: PinCodeScreen.Builder()
                )
            ),
            else: Wildcard(
                screen: OnboardingScreen(),
                pathBuilder: OnboardingScreen.Builder()
            )
        )
    }
}
