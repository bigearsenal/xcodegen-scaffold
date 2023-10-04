import Login
import Resolver
import SignUp
import SwiftUI

public struct OnboardingView: View {
    // MARK: - Properties

    @StateObject private var viewModel: OnboardingViewModel
    @State private var showLogin = false
    @State private var showSignUp = false

    // MARK: - Initializer

    public init(onLoggedIn: @escaping () -> Void) {
        _viewModel = .init(wrappedValue: .init(onLoggedIn: onLoggedIn))
    }

    public var body: some View {
        VStack {
            Image(.flower)
                .resizable()
                .frame(width: 40, height: 40)

            Text("Login or Sign up to continue")

            Button(action: {
                showLogin = true
            }, label: {
                Text("Login")
            })

            Button(action: {
                showSignUp = true
            }, label: {
                Text("Sign up")
            })
        }
        .sheet(isPresented: $showLogin, content: {
            LoginView(loginService: Resolver.resolve()) {
                viewModel.onLoggedIn()
            }
        })
        .sheet(isPresented: $showSignUp, content: {
            SignUpView {
                viewModel.onLoggedIn()
            }
        })
    }
}

#Preview {
    OnboardingView {}
}
