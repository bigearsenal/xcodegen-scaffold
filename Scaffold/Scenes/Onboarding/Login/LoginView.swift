import SignUp
import SwiftUI

public struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel = .init()

    @State private var showingAlert = false

    public init() {}

    public var body: some View {
        VStack {
            Button(action: {
                Task {
                    await viewModel.login()
                }
            }, label: {
                Text("Login")
            })

            Button(action: {
                showingAlert = true
            }, label: {
                Text("Show alert")
            })
        }
        .fullScreenCover(isPresented: $showingAlert, content: {
            Text("FullScreen")
        })
    }
}

#Preview {
    LoginView()
}
