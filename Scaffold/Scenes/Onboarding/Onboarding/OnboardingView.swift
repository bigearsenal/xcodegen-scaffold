import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel

    var body: some View {
        VStack {
            Image(.flower)
                .resizable()
                .frame(width: 40, height: 40)

            Text("Login or Sign up to continue")

            Button(action: {
                viewModel.openLogin()
            }, label: {
                Text("Login")
            })

            Button(action: {
                viewModel.openSignUp()
            }, label: {
                Text("Sign up")
            })
        }
    }
}

#Preview {
    OnboardingView(viewModel: .init(coordinator: .init()))
}
