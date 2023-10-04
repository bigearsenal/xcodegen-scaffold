import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel: SignUpViewModel

    init(onSignedUp: @escaping () -> Void) {
        _viewModel = .init(wrappedValue: .init(onSignedUp: onSignedUp))
    }

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
    SignUpView {}
}
