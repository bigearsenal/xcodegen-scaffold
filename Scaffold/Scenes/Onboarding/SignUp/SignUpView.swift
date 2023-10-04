import SwiftUI

public struct SignUpView: View {
    @StateObject private var viewModel: SignUpViewModel

    public init(onSignedUp: @escaping () -> Void) {
        _viewModel = .init(wrappedValue: .init(onSignedUp: onSignedUp))
    }

    public var body: some View {
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
