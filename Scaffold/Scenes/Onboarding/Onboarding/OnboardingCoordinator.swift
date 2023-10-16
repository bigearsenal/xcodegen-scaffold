import Common
import Foundation
import Login
import SignUp
import Stinsen
import SwiftUI

public final class OnboardingCoordinator: NavigationCoordinatable {
    public let stack = Stinsen.NavigationStack(initial: \OnboardingCoordinator.start)

    @Root private var start = makeStart
    @Route(.push) var login = makeLogin
    @Route(.push) var signUp = makeSignUp

    public init() {}

    deinit {
        print("Deinit \(String(reflecting: self))")
    }

    @ViewBuilder func makeStart() -> some View {
        OnboardingView()
    }

    @ViewBuilder func makeLogin() -> some View {
        LoginView()
    }

    @ViewBuilder func makeSignUp() -> some View {
        SignUpView()
    }
}
