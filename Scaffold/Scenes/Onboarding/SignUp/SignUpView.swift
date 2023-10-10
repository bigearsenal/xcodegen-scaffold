import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel: SignUpViewModel = .init()

    var body: some View {
        Button(action: {
            Task {
                await viewModel.signUp()
            }
        }, label: {
            Text("Sign up")
        })
    }
}

#Preview {
    SignUpView()
}
