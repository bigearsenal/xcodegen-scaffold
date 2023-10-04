import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel

    init(onLoggedIn: @escaping () -> Void) {
        _viewModel = .init(wrappedValue: .init(onLoggedIn: onLoggedIn))
    }

    var body: some View {
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
