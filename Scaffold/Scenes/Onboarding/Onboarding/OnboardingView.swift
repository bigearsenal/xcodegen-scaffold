import Login
import SignUp
import SwiftUI

public struct OnboardingView: View {
    // MARK: - Properties

    @StateObject private var viewModel: OnboardingViewModel

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
                viewModel.currentScene = .login
            }, label: {
                Text("Login")
            })

            Button(action: {
                viewModel.currentScene = .signUp
            }, label: {
                Text("Sign up")
            })
        }
        .sheet(item: $viewModel.currentScene) { scene in
            switch scene {
            case .login:
                LoginView {
                    viewModel.onLoggedIn()
                }
            case .signUp:
                SignUpView {
                    viewModel.onLoggedIn()
                }
            }
        }
    }
}

#Preview {
    OnboardingView {}
}
