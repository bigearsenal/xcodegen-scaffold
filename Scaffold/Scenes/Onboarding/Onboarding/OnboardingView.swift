import Login
import SignUp
import Stinsen
import SwiftUI

struct OnboardingView: View {
    // MARK: - Properties

    @EnvironmentObject private var coordinator: OnboardingCoordinator.Router
    @StateObject private var viewModel: OnboardingViewModel = .init()

    // MARK: - Initializer

    var body: some View {
        VStack {
            Image(.flower)
                .resizable()
                .frame(width: 40, height: 40)

            Text("Login or Sign up to continue")

            Button(action: {
                coordinator.route(to: \.login)
            }, label: {
                Text("Login")
            })

            Button(action: {
                coordinator.route(to: \.signUp)
            }, label: {
                Text("Sign up")
            })
        }
    }
}

#Preview {
    OnboardingView()
}
