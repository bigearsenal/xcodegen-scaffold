import Common
import Resolver
import SwiftUI

public struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel

    public init(
        loginService: LoginService,
        onLoggedIn: @escaping () -> Void
    ) {
        _viewModel = .init(
            wrappedValue: .init(
                loginService: loginService,
                onLoggedIn: onLoggedIn
            )
        )
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
    LoginView(loginService: MockLoginService()) {}
}
