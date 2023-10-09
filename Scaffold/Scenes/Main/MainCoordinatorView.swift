import Home
import Onboarding
import SwiftUI

public struct MainCoordinatorView: View {
    @StateObject private var viewModel: MainViewModel = .init()

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
    MainCoordinatorView()
}
