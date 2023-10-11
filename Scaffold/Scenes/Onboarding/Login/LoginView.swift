import SignUp
import SwiftUI

public struct LoginView: View {
    @Environment(\.navigator) private var navigator
    @Environment(\.currentScreen) private var currentScreen

    @StateObject private var viewModel: LoginViewModel = .init()

    @State private var showingAlert = false

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

                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                    navigator.go(to: SignUpScreen(), on: currentScreen)
                }
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
