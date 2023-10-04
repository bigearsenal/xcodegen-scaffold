import Main
import Onboarding
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ContentViewModel = .init()

    var body: some View {
        if viewModel.isLoggedIn {
            MainView {
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
    ContentView()
}
