import SwiftUI

public struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel = .init()

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
    LoginView()
}
