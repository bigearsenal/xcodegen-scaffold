import SwiftUI

public struct MainView: View {
    @StateObject private var viewModel: MainViewModel

    public init(onLoggedOut: @escaping () -> Void) {
        _viewModel = .init(wrappedValue: .init(onLoggedOut: onLoggedOut))
    }

    public var body: some View {
        VStack {
            Text("Hello!")
            Button(action: {
                Task {
                    await viewModel.logout()
                }
            }, label: {
                Text("Log out")
            })
        }
    }
}

#Preview {
    MainView {}
}
