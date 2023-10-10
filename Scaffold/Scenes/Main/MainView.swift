import Home
import Onboarding
import SwiftUI

struct MainView: View {
    @StateObject private var viewModel: MainViewModel = .init()

    var body: some View {
        if viewModel.isLoggedIn {
            HomeView {
                viewModel.isLoggedIn = false
            }
        } else {
            OnboardingView {
                viewModel.isLoggedIn = true
            }
        }
    }
}

#Preview {
    MainView()
}
