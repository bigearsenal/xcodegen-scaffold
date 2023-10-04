import Home
import Onboarding
import SwiftUI

public struct MainView: View {
    @StateObject private var viewModel: ContentViewModel = .init()

    public init() {}

    public var body: some View {
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
