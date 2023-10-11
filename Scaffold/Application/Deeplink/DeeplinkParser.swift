import ComposableDeeplinking
import Onboarding
import SignUp

extension DeeplinkParser {
    /// <scheme>://signup?name={name}
    static let signUp = DeeplinkParser(
        parse: { deeplink in
            print(deeplink)
            guard deeplink.components.count == 1,
                  deeplink.components[0].name == "signup",
                  case let .value(name) = deeplink.components[0].arguments?["name"]
            else {
                return []
            }

            return [
                OnboardingScreen().eraseToAnyScreen(),
                SignUpScreen().eraseToAnyScreen(),
            ]
        }
    )
//    /// example://detail?id={id}/capacity
//    static let detailSettings = DeeplinkParser(
//        parse: { deeplink in
//            print(deeplink)
//            guard deeplink.components.count == 2,
//                  deeplink.components[0].name == "detail",
//                  case let .value(id) = deeplink.components[0].arguments?["id"],
//                  deeplink.components[1].name == "capacity"
//            else {
//                return []
//            }
//
//            return [
//                MainScreen().eraseToAnyScreen(),
    ////                DetailScreen(id: Int(id), train: nil).eraseToAnyScreen(),
    ////                CapacityScreen(capacity: nil, trainId: Int(id)).eraseToAnyScreen(),
//            ]
//        }
//    )
}
