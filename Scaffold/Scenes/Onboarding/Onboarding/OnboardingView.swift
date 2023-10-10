import Login
import SignUp
import SwiftUI

struct OnboardingView: View {
    // MARK: - Properties

    @Environment(\.navigator) private var navigator
    @Environment(\.currentScreen) private var currentScreen
    @StateObject private var viewModel: OnboardingViewModel = .init()

    // MARK: - Initializer

    var body: some View {
        VStack {
            Image(.flower)
                .resizable()
                .frame(width: 40, height: 40)

            Text("Login or Sign up to continue")

            Button(action: {
                navigator.go(to: LoginScreen(), on: currentScreen)
            }, label: {
                Text("Login")
            })

            Button(action: {
                navigator.go(to: SignUpScreen(), on: currentScreen)
            }, label: {
                Text("Sign up")
            })
        }
    }
}

#Preview {
    OnboardingView()
}
