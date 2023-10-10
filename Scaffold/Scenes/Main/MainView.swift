import Home
import Onboarding
import SwiftUI

struct MainView: View {
    @Environment(\.navigator) private var navigator
    @Environment(\.currentScreen) private var currentScreen
    @StateObject private var viewModel: MainViewModel = .init()

    var body: some View {
        VStack {
            if viewModel.isLoggedIn {
                HomeView {}
            } else {
                Button("Login or SignUp") {
                    navigator.go(
                        to: OnboardingScreen(),
                        on: currentScreen
                    )
                }
            }
        }
    }
}

#Preview {
    MainView()
}
