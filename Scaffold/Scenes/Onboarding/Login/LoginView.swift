import SwiftUI

public struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel

    public init(onLoggedIn: @escaping () -> Void) {
        _viewModel = .init(wrappedValue: .init(onLoggedIn: onLoggedIn))
    }

    public var body: some View {
        Button(action: {
            Task {
                await viewModel.login()
            }
        }, label: {
            Text("Login")
        })
    }
}

#Preview {
    LoginView {}
}
