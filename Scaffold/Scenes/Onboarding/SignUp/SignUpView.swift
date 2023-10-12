import SwiftUI

public struct SignUpView: View {
    @StateObject private var viewModel: SignUpViewModel = .init()

    @State private var showingAlert = false

    public init() {}

    public var body: some View {
        VStack {
            Button(action: {
                Task {
                    await viewModel.signUp()
                }
            }, label: {
                Text("Sign up")
            })

            Button(
                action: {
                    showingAlert = true
                },
                label: {
                    Text("Push another")
                }
            )
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("OK", role: .cancel) {
                showingAlert = false
            }
        }
    }
}

#Preview {
    SignUpView()
}
